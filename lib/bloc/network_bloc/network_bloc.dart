import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/network_helper.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    /*
    On Event of NetworkObserve fired in main.dart
    use _observe method to fire the Connectivity listener

    This _observe Method will fire the NetworkNotify Event in
    Network Helper class
    */
    on<NetworkObserve>(_observe);
    /*
    on Event of NetworkNotify fired in NetworkHelper class
    emit the Success or Failure state using _notifyStatus method
     */
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  /*
  function to register Connectivity listener on NetworkObserve Event

  Based on the listener result we will fire the NetworkNotify Event
   */
  void _observe(event,emit) {
    NetworkHelper.observeNetwork();
  }

  /*
   Now here we emitting the status based on the NetworkNotify event's response using
   isConnected Boolean
   */
  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}