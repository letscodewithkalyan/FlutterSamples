import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasNetworkConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == [ConnectivityResult.none]) {
    return false;
  }
  return true;
}
