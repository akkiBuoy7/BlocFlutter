abstract class NetworkEvent {}

class NetworkObserve extends NetworkEvent {}

class NetworkNotify extends NetworkEvent {
  final bool isConnected;

  NetworkNotify({this.isConnected = false});
}
/*
NetworkNotify event provides us to emit status based on network status sent by
NetworkHelper.

With the “NetworkObserve” event we’ll start listening for network changes in
NetworkHelper.
 */