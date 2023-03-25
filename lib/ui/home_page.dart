import 'package:bloc_app/bloc/internet_bloc/internet_state.dart';
import 'package:bloc_app/bloc/network_bloc/network_bloc.dart';
import 'package:bloc_app/bloc/network_bloc/network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internet_bloc/internet_conn_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Check Connection"),
        ),
        body: Center(
          child: BlocConsumer<NetworkBloc, NetworkState>(
            builder: (BuildContext context, state) {
              if (state is NetworkSuccess) {
                return Text("Connected");
              } else if (state is NetworkFailure) {
                return Text("Not connected");
              } else {
                return Text("Loading...");
              }
            },
            listener: (BuildContext context, Object? state) {
              if (state is NetworkSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state is NetworkFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Disconnected"),
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),
        ));
  }
}
