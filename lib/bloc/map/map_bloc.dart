import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';



class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<SetMapController>(_onSetMapController);
    on<UpdateLocation>(_onUpdateLocation);
  }

  void _onSetMapController(SetMapController event, Emitter<MapState> emit) {
    if (state is MapLoaded) {
      emit(MapLoaded(event.mapController, (state as MapLoaded).userLocation));
    } else {
      emit(MapLoaded(event.mapController, LatLng(0, 0)));
    }
  }

  void _onUpdateLocation(UpdateLocation event, Emitter<MapState> emit) {
    if (state is MapLoaded) {
      final mapController = (state as MapLoaded).mapController;
      mapController.animateCamera(
        CameraUpdate.newLatLng(event.location),
      );
      emit(MapLoaded(mapController, event.location));
    }
  }
}
