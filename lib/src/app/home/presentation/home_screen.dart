import 'dart:async';

import 'package:cloudwalk_location/src/app/home/domain/model/position_model.dart';
import 'package:cloudwalk_location/src/app/home/presentation/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kMarkerId = 'current_marker';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final HomeController _homeController = GetIt.I<HomeController>();

  Marker _marker = const Marker(
    markerId: MarkerId(kMarkerId),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        markers: {_marker},
        initialCameraPosition: const CameraPosition(
          target: LatLng(-14.2400732, -53.1805017),
          zoom: 4,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 24, bottom: 16),
          child: ListenableBuilder(
            listenable: _homeController,
            builder: (context, child) {
              return _homeController.loading
                  ? const CircularProgressIndicator()
                  : FloatingActionButton.small(
                      onPressed: _goToCurrentLocation,
                      child: const Icon(
                        Icons.location_searching,
                        color: Colors.black,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  _goToCurrentLocation() async {
    final GoogleMapController mapController = await _controller.future;

    final position = await _homeController.getCurrentPosition();

    position.fold(
      ifRight: (position) => _updateMarker(position, mapController),
      ifLeft: (errorMessage) => _showAlert(errorMessage.message),
    );
  }

  void _updateMarker(
    final PositionModel position,
    final GoogleMapController mapController,
  ) {
    setState(() {
      _marker = Marker(
        markerId: const MarkerId(kMarkerId),
        position: LatLng(position.lat, position.lon),
      );
    });

    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(_marker.position, 14.5),
    );
  }

  void _showAlert(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
