import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'internet_error_widget.dart';


class InterNetworkService {
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isMainDart = false;
  bool _firstCall = false;
  final BuildContext context;

  InterNetworkService(
    this.context,
  );

  Future<dynamic> updateConnectivity(
    ConnectivityResult result,
  ) 
  async {
    if (result == ConnectivityResult.none) {
      connectionStatus = result;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InternetErrorWidget(
                    ismaindart: false,
                  )));
      _firstCall = false;
    } else if (_firstCall == true && result != ConnectivityResult.none) {
      return;
    } else {
      _firstCall == false ? Navigator.pop(context) : null;
    
    }
  }

  Future<dynamic> checklive(
      ConnectivityResult result, bool callSubscription, firstcall) async {
    connectionStatus = await _connectivity.checkConnectivity();
    if (callSubscription == true) {
      _firstCall = firstcall;
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(updateConnectivity);
    }
    return connectionStatus;
  }

  subScriptioncancel() {
    _connectivitySubscription.cancel();
  }
}