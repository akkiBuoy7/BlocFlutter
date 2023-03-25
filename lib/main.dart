import 'package:bloc_app/bloc/internet_bloc/internet_conn_bloc.dart';
import 'package:bloc_app/bloc/my_bloc/my_network_bloc.dart';
import 'package:bloc_app/bloc/my_bloc/my_netwrok_event.dart';
import 'package:bloc_app/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/network_bloc/network_bloc.dart';
import 'bloc/network_bloc/network_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:
      // BlocProvider(create: (context) =>
      // // Firing Network observe event
      // MyInternetBloc()
      //   ..add(MyInternetObservedEvent()),
      //   child: MyHomePage(),),);
      //


      BlocProvider(create: (context) =>
      // Firing Network observe event
      NetworkBloc()
        ..add(NetworkObserve()),
          child: MyHomePage(),),);
  }
}

