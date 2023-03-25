import 'package:connectivity/connectivity.dart';

import '../bloc/network_bloc/network_bloc.dart';
import '../bloc/network_bloc/network_event.dart';

class NetworkHelper {

  // This function fires the Network Notify events
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // Firing event
        NetworkBloc().add(NetworkNotify()); // default value is false
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true)); // make the boolean true
      }
    });
  }
}