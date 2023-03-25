import 'dart:async';

import 'package:bloc_app/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_app/bloc/internet_bloc/internet_state.dart';
import 'package:bloc_app/bloc/my_bloc/my_network_state.dart';
import 'package:bloc_app/helper/my_network_helper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_netwrok_event.dart';

class MyInternetBloc extends Bloc<MyInternetEvent, MyInternetState> {
  MyNetworkHelper? myNetworkHelper = MyNetworkHelper();

  MyInternetBloc() : super(MyInternetInitialState()) {
    on<MyInternetObservedEvent>(_observe);
    on<MyInternetConnectedEvent>(_connected);
    on<MyInternetLostEvent>(_lost);
  }

  @override
  Future<void> close() {
    myNetworkHelper?.connectivitySubscription?.cancel();
    return super.close();
  }

  void _observe(event, emit) {
    myNetworkHelper?.observeNetwork();
  }

  void _connected(event, emit) {
    print("***************emitting connected");
    emit(MyInternetConnectedState());
  }

  void _lost(event, emit) {
    print("***************emitting lost");
    emit(MyInternetLostState());
  }
}
