import 'dart:async';

import 'package:connectivity/connectivity.dart';

import '../bloc/my_bloc/my_network_bloc.dart';
import '../bloc/my_bloc/my_netwrok_event.dart';
import '../bloc/network_bloc/network_bloc.dart';
import '../bloc/network_bloc/network_event.dart';

class MyNetworkHelper {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  // This function fires the Network Notify events
  void observeNetwork() {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {

          print("**********observing");
          if (result == ConnectivityResult.none) {
            MyInternetBloc().add(MyInternetLostEvent());
          } else {
            MyInternetBloc().add(MyInternetConnectedEvent());
          }

    });
  }


}
