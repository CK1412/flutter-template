import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

class NetworkConnectivity {
  static final NetworkConnectivity instance = NetworkConnectivity._();
  NetworkConnectivity._() {
    _initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectionStatus? _status;
  ConnectionStatus get status => _status ?? ConnectionStatus.offline;

  // Call when launch app
  void init() {
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      _updateConnectionStatus(connectivityResult);
    } catch (e) {
      Logger().e('Init Connectivity: $e');
    }
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        _status = ConnectionStatus.online;
      default:
        _status = ConnectionStatus.offline;
    }
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }
}

enum ConnectionStatus {
  online,
  offline,
}

extension ConnectionStatusEx on ConnectionStatus {
  bool get isOnline => this == ConnectionStatus.online;
  bool get isOffline => this == ConnectionStatus.offline;
}
