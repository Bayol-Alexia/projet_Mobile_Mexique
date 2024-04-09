import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_mobil/constantes.dart' as con;

class InfoBurger extends StatefulWidget {
  const InfoBurger({super.key});

  @override
  State<InfoBurger> createState() => _InfoBurgerState();
}

class _InfoBurgerState extends State<InfoBurger> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final datos1 = [
      'Hamburguesa',
      'Hamburguesa de res',
      'Hamburguesa de res con queso y tocino'
    ];
    final datos2 =[ 'Lechuga', 'Cebolla', 'Tomate', 'Queso', 'Tocino', 'Pan', 'Carne de res', 'Pollo'];
    return Scaffold(
        backgroundColor: con.fondo,
        appBar: AppBar(
          backgroundColor: con.fondo,
          title: Center(
            child: Image.asset(
              'images/Welcome2.png',
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
        body: Container(
          height: 500,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: con.blanco,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize:
            MainAxisSize.min, //OCUPA EL ESPACIO MINIMO DE LOS WIDGETS HIJOS
            children: [
              Image.asset(
                'images/Hamburguesa1.png',
                width: size.width * 0.8,
              ),
              Text(datos1[1],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(
                datos2[5] + ' + '+ datos2[6]+ ' + '+ datos2[3]+ ' + '+ datos2[0]+' + '+ datos2[2]+ ' + '+ datos2[1],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ));
  }
}