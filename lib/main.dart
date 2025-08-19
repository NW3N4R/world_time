import 'package:flutter/material.dart';
import 'package:world_time/pages/choosecountry.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/load.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Load(),
      '/home': (context) => Home(),
      '/choosecountry': (context) => Choosecountry(),
    },
  ),
);
