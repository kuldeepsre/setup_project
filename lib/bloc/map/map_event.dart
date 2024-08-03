part of 'map_bloc.dart';
abstract class MapEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetMapController extends MapEvent {
  final GoogleMapController mapController;

  SetMapController(this.mapController);

  @override
  List<Object> get props => [mapController];
}

class UpdateLocation extends MapEvent {
  final LatLng location;

  UpdateLocation(this.location);

  @override
  List<Object> get props => [location];
}