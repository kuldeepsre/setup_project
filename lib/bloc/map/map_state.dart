part of 'map_bloc.dart';


abstract class MapState extends Equatable {
  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapLoaded extends MapState {
  final GoogleMapController mapController;
  final LatLng userLocation;

  MapLoaded(this.mapController, this.userLocation);

  @override
  List<Object> get props => [mapController, userLocation];
}