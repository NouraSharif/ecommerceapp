import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> internetCheck() async {
  final result = await Connectivity().checkConnectivity();
  return result != ConnectivityResult.none;
}

/*
import 'dart:io';

internetCheck() async {
  var response = await InternetAddress.lookup("google.com");
  try {
    if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}*/
