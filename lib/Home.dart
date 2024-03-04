import 'package:flutter/material.dart';
import 'package:proyecto_mobil/constantes.dart' as con;
import 'package:proyecto_mobil/utils/singleton.dart';
import 'package:proyecto_mobil/infoBurger.dart';


import 'appBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = 'Todos'; // Initialize selected category
  final ScrollController scrollController = ScrollController();

  Singleton singleton = Singleton();

  @override
  void initState() {
    singleton.iniciarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo,
      appBar: AppBar(
        backgroundColor: con.fondo,
        title: Center(
          child: Image.asset(
            '../images/Welcome2.png',
            width: size.width * 0.1,
          ),
        ),
        iconTheme: IconThemeData(color: con.blanco),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.local_grocery_store),
          ),
        ],
      ),
      drawer: drawerWidget(singleton: singleton),
      body: Stack(children: [
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Qué hay de cenar?',
                style: TextStyle(
                  color: con.secundario,
                  fontSize: 24,
                  letterSpacing: 1.5,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemCount: singleton.titleProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = singleton.titleProducts[index];
                      });
                    },
                    child: Text(
                      singleton.titleProducts[index],
                      style: TextStyle(
                        color: selectedCategory == singleton.titleProducts[index] ? con.primario : con.blanco,
                        fontSize: 18,
                      ),
                    ),
                  );
                }),
          ),
          ListProductHome(size, singleton.products),
        ])
      ]),
    );
  }

  Container ListProductHome(Size size, List products) {
    List filteredProducts = selectedCategory == 'Todos'
        ? products
        : products.where((product) => product.contains(selectedCategory)).toList();

    int indexLeft = 0;
    int indexRight = 1;
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: con.secundario, borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
            height: size.height * 0.65,
            width: size.width,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: (filteredProducts.length / 2).ceil(),
              itemBuilder: (BuildContext context, int index) {
                var datos1 = filteredProducts[indexLeft].split('#');
                var datos2 = filteredProducts[indexRight].split('#');
                //dato[1] tiene el nombre
                var rowWidget = Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: InkWell(
                            onTap: () {
                              print('${datos1[1]}');
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(datos1[1]),
                                      content: Text(datos1[2]),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Confirm'),
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoBurger()));                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 165,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: con.blanco,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                //OCUPA EL ESPACIO MINIMO DE LOS WIDGETS HIJOS
                                children: [
                                  Image.asset(
                                    '../images/Hamburguesa1.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(datos1[1],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(
                                    datos1[2],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellowAccent,
                                        size: 14,
                                      ),
                                      Icon(
                                        Icons.heart_broken_outlined,
                                        size: 14,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        products[index + 1].isNotEmpty
                            ? Expanded(
                          flex: 6,
                          child: InkWell(
                            onTap: () {
                              print('${datos2[1]}');
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(datos2[1]),
                                      content: Text(datos2[2]),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Confirm'),
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoBurger()));                                                },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 165,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: con.blanco,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                //OCUPA EL ESPACIO MINIMO DE LOS WIDGETS HIJOS
                                children: [
                                  Image.asset(
                                    '../images/Hamburguesa2.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(datos2[1],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text(
                                    datos2[2],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellowAccent,
                                        size: 14,
                                      ),
                                      Icon(
                                        Icons.heart_broken_outlined,
                                        size: 14,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : Container()
                      ],
                    ));
                indexLeft += 2;
                indexRight += 2;
                return rowWidget;
              },
            )));
  }
}