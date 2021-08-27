import 'package:camera_demoo/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //theme: ThemeData.dark(), 
      initialRoute: '/', 
      routes: {
        '/': (context) => HomePage(),
      }),
  );
}
