// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dictionary/src/app/pages/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @mustCallSuper
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boring Flutter App',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
