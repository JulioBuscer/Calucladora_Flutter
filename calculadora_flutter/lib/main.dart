import 'package:calculadora_flutter/ejemplo3.dart';
import 'package:calculadora_flutter/ejemplo4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculadora',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Suma());
  }
}
