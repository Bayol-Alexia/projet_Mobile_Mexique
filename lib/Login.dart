import 'package:flutter/material.dart';
import 'package:proyecto_mobil/constantes.dart' as con;

import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.45),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('../images/Welcome1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // set the backgroud color to brown
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.55),
            child: Container(
              color: con.fondo,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              '../images/Welcome2.png',
              width: size.width * 0.4,
            ),
          ),
          //Login Menu without pixel overflow
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.45,
              left: size.width * 0.05,
              right: size.width * 0.05,
            ),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.50,
                  padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: con.blanco,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Bienvenido a Burger Classic',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: con.secundario,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Correo/Usuario',
                            //only the bottom border
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: con.primario,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            fixedSize:
                                Size(size.width * 0.6, size.height * 0.05),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(color: con.blanco, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Olvidaste tu contraseña?',
                            style: TextStyle(color: con.secundario),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
