// network_service.dart
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();

  Future<bool> isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Stream<bool> get connectivityStream {
    return _connectivity.onConnectivityChanged.map(
          (result) => result != ConnectivityResult.none,
    );
  }
}
