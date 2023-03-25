import 'dart:async';

import 'package:bloc_app/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_app/bloc/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetConnectedEvent>((event, emit) => InternetConnectedState());
    on<InternetLostEvent>((event, emit) => InternetLostState());


    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {

      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetConnectedEvent());
      }else{
        add(InternetLostEvent());
      }
    });

  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
