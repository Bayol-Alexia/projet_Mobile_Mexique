import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:proyecto_mobil/constantes.dart' as con;
import 'package:proyecto_mobil/utils/singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyecto_mobil/utils/utils.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final password = TextEditingController();
  bool bandera = false;

  //initialize prefs

  Singleton singleton = Singleton();
  late final SharedPreferences prefs;

  @override
  void initState() {
    checkPosition();
    super.initState();
  }

  void checkPosition() async {
    Position position = await Utils.determinePosition();
    singleton.latitud = position.latitude;
    singleton.longitud = position.longitude;
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    checkIsLogin();
  }

  void checkIsLogin() {
    //String user = (prefs.getString('user') ?? '');
    //String password = (prefs.getString('pass') ?? '');
    bool band = (prefs.getBool('isLogeado') ?? false);

    if (band) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    }
  }

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
                  image: AssetImage('images/Welcome1.png'),
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
              'images/Welcome2.png',
              width: size.width * 0.4,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.2,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: size.height * 0.18),
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
                          'Bienvenido a Burger Classic',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: con.secundario,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          controller: user,
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Correo/Usuario',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        bandera
                            ? Text(
                          'USUARIO O CONTRASENA INCORRECTOS',
                          style: TextStyle(
                              color: con.terciario, fontSize: 20),
                        )
                            : Container(),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: con.primario,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            fixedSize:
                            Size(size.width * 0.6, size.height * 0.05),
                          ),
                          onPressed: () {
                            if (user.text == 'admin' &&
                                password.text == 'admin') {
                              singleton.user = user.text;
                              singleton.password = password.text;

                              // prefs.setString('user', user.text);
                              // prefs.setString('pass', password.text);
                              // prefs.setBool('isLogeado', true);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Home()));
                            } else {
                              setState(() {
                                bandera = true;
                              });
                            }
                          },
                          child: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(color: con.blanco, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Olvidaste tu contraseña?',
                            style: TextStyle(color: con.secundario),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                      ],
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
}