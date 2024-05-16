import 'package:core_exam/screens/detailPage.dart';
import 'package:core_exam/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homepage(),
        'detailPage': (context) => detailPage(),
      },
    ),
  );
}
