
import 'package:flutter/material.dart';
import 'package:presently/screens/home.dart';
import 'package:presently/screens/login.dart';

var routes = <String, WidgetBuilder> {
  'home': (BuildContext context) => HomeScreen(),
  'login': (BuildContext context) => LoginScreen(),
};