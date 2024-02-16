import 'package:flutter/material.dart';
import 'package:proyecto_mobil/constantes.dart' as con;

import 'appBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
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
      drawer: drawerWidget(),
      body: Stack(
          children: []
      ),
    );
  }
}

