import 'package:flutter/material.dart';
import 'package:proyecto_mobil/constantes.dart' as cons;
import 'package:proyecto_mobil/utils/singleton.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _Map();
}

class _Map extends State<Map> {
  Singleton singleton = Singleton();

  late GoogleMapController mapController;

  late LatLng _center = const LatLng(22.158697, -102.68745);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        backgroundColor: cons.blanco,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11,
            ),
          ),
        ],
      ),
    );
  }
}