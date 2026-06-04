import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  final Connectivity _connectivity;

  NetworkChecker({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  Future<bool> estConnecte() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Stream<bool> get connectiviteStream => _connectivity.onConnectivityChanged
      .map((result) => result != ConnectivityResult.none);
}
