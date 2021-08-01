import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

//using change notifer to notify state chnages of the internet connection
//mutability

class InternetChecker extends ChangeNotifier {
  final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectionSubscription;
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  InternetChecker() : _connectivity = Connectivity() {
    _initializeConnection();
    //listening for connection changes stream subscription
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen(_connectivityResult);
  }

  Future<void> _initializeConnection() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      _connectivityResult(result);
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
  }

//chekcing for connectivity result  1. no connection 2.wifi/mobile
  _connectivityResult(ConnectivityResult connectivityResult) {
    //if no internet connection or no internet from ISP
    if (connectivityResult == ConnectivityResult.none) {
      _isConnected = false;
      notifyListeners();
    } else {
      //else if its connected to WIFI/MOBILE
      _isConnected = true;
      notifyListeners();
    }
  }
}
