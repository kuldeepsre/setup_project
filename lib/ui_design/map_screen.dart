import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../bloc/map/map_bloc.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/permission_service.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndGetLocation();
  }

  Future<void> _checkPermissionsAndGetLocation() async {
    bool isGranted = await PermissionService.isLocationPermissionGranted();
    if (!isGranted) {
      bool permissionGranted = await PermissionService.requestLocationPermission();
      if (!permissionGranted) {
        // Handle permission denial
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Location Permission Required'),
              content: const Text('This app needs location permission to function. Please enable it in the app settings.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    openAppSettings();
                  },
                  child: const Text('Open Settings'),
                ),
              ],
            );
          },
        );
        return;
      }
    }
    _getCurrentLocation();
    _startLocationUpdates();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
        BlocProvider.of<MapBloc>(context).add(UpdateLocation(
          LatLng(position.latitude, position.longitude),
        ));
      });
    } catch (e) {
      // Handle error
      print('Error getting location: $e');
    }
  }

  void _startLocationUpdates() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      BlocProvider.of<MapBloc>(context).add(UpdateLocation(
        LatLng(position.latitude, position.longitude),
      ));
    }).onError((error) {
      // Handle error
      print('Error getting location stream: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Tracking Example'),
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapLoaded) {
            return GoogleMap(
              onMapCreated: (controller) {
                if (_mapController == null) {
                  _mapController = controller;
                  BlocProvider.of<MapBloc>(context).add(SetMapController(controller));
                }
              },
              initialCameraPosition: CameraPosition(
                target: state.userLocation,
                zoom: 15,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}