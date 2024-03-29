import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> verifyConnection() async {
  final connetion = await Connectivity().checkConnectivity();

  if (connetion.contains(ConnectivityResult.mobile) ||
      connetion.contains(ConnectivityResult.wifi)) {
    return true;
  } else {
    return false;
  }
}
