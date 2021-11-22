import 'package:bloc_demo/api/services.dart';
import 'package:bloc_demo/bloc/bloc.dart';
import 'package:bloc_demo/screens/albums_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AlbumsBloc(albumRepo: AlbumServices()),
        child: AlbumsScreen(),
      ),
    );
  }
}