import 'package:flutter/material.dart';
import 'package:ChicknTender/category-select.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override // decorator -- clean code. forces it to override the widget's method. saying you're doing it on purpose.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chickn\' Tender',
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Color(0xffFCD581),
          accentColor: Colors.redAccent),
      home: CategorySelect(title: 'Chickn\' Tender'),
      debugShowCheckedModeBanner: false,
    );
  }
}
