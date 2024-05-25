// ignore_for_file: unreachable_from_main

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../logger/logger.dart';

typedef ConnectionStatusNotifier = ValueNotifier<ConnectionStatus>;

class NetworkConnectivity {
  NetworkConnectivity._();

  static NetworkConnectivity? _instance;

  factory NetworkConnectivity() {
    return _instance ??= NetworkConnectivity._();
  }

  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  late ConnectionStatusNotifier _networkStatus;

  ConnectionStatus get networkStatus => _networkStatus.value;

  ConnectionStatusNotifier get networkStatusNotifier => _networkStatus;

  // Call when launch app
  void init() {
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    try {
      _networkStatus = ValueNotifier(ConnectionStatus.offline);

      _subscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

      Logger().i('NetworkConnectivity init success');
    } catch (e) {
      Logger().e('NetworkConnectivity init failure', error: e);
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    // Update network status
    if (connectivityResult.containsAny([
      ConnectivityResult.mobile,
      ConnectivityResult.wifi,
      ConnectivityResult.ethernet,
    ])) {
      _networkStatus.value = ConnectionStatus.online;
    } else {
      _networkStatus.value = ConnectionStatus.offline;
    }
  }

  void dispose() {
    _subscription.cancel();
    logger.i('NetworkConnectivity is disposed.');
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
