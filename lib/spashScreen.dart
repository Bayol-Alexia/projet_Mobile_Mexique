import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_mobil/Login.dart';
import 'package:proyecto_mobil/constantes.dart' as con;
import 'package:proyecto_mobil/dependance.dart';

import 'Home.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<splashScreen> createState() => _splashScreen();
}

class _splashScreen extends State<splashScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('../images/Welcome1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05, left: size.width * 0.05),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('../images/Welcome2.png', width: size.width*0.4,))),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.1),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                },
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: con.blanco),
                ),
                style: ElevatedButton.styleFrom(
                  primary: con.primario,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.05),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Si no tiene cuenta, ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Registrese',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
// This trailing comma makes auto-formatting nicer for build methods.
}
