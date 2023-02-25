import 'package:flutter/material.dart';

import 'Views/Screen/Details.dart';
import 'Views/Screen/HomePage.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        'det' : (context) => DetailsPage(),
      },
    ),
  );
}
