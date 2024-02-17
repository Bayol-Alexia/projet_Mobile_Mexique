import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_mobil/constantes.dart' as con;
import 'package:file_picker/file_picker.dart';

import 'Home.dart';

class Cuenta extends StatefulWidget {
  const Cuenta({super.key});

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final direccion = TextEditingController();
  final password = TextEditingController();
  bool bandera = false;
  /*late String _filePath;

  void _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    }
  }*/

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
          Positioned(
            //top: size.height * 0.45,
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.08,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: size.height * 0.05,
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      color: con.blanco,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Bienvenido al registro',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: con.secundario,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: nombre,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nombre Completo',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: correo,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Correo',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: direccion,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Direccion de envio',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        bandera
                            ? Text(
                                'FALTA LLENAR CAMPOS',
                                style: TextStyle(
                                    color: con.terciario, fontSize: 20),
                              )
                            : Container(),
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
                            if (nombre.text.isNotEmpty &&
                                correo.text.isNotEmpty &&
                                direccion.text.isNotEmpty &&
                                password.text.isNotEmpty) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Home()));
                            } else {
                              setState(() {
                                bandera = true;
                              });
                            }
                          },
                          child: const Text(
                            'Regristrarse',
                            style: TextStyle(color: con.blanco, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Politicas de Privacidad',
                            style: TextStyle(color: con.secundario),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.23, // Position du haut du rectangle
            left: size.width * 0.05, // Position de gauche du rectangle
            right: size.width * 0.05, // Position de droite du rectangle
            child: Center(
              child: Container(
                width: size.width * 0.2, // Largeur du rectangle
                height: 100, // Hauteur du rectangle
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Couleur de fond du rectangle
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: con.terciario,width: 3.0),// Bordures arrondies
                ),
               /* child: Center(
                  child: ElevatedButton(
                    onPressed: _pickImage, child: Text('Foto'),
                  ),
                ),*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}
