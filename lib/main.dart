import 'package:flutter/material.dart';
import 'package:myapp/screens/bottom_bar.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo App",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: BottomBar()));
}
