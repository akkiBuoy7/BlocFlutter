import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/network_helper.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    // On Event of NetworkObserve emit the state
    on<NetworkObserve>(_observe);
    //on<NetworkObserve>((event,emit)=> NetworkHelper.observeNetwork());
    // On Event of NetworkNotify emit the state
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  void _observe(event,emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}