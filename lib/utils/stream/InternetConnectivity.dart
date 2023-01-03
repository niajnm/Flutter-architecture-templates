import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

import 'package:onefish/utils/ServiceLocator.dart';
import 'package:onefish/utils/logger/Log.dart';

class InternetConnectivity {
  final Connectivity _connectivity = Connectivity();
  InternetConnectivity(_connectivity);

  Stream<ConnectivityResult> isConnected() {
    return _connectivity.onConnectivityChanged;
  }

  /**
     * On changes to connectivity status update the NetConnectivity Provider Status
     */
  Future<bool> updateConnectionStatus(ConnectivityResult result) async {
    serviceLocator.get<Log>().info('Internet Listenerr Data $result');
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
