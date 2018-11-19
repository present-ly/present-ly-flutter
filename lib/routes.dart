import 'package:flutter/material.dart';
import 'package:presently/presently-toolbar.dart';
import 'package:presently/screens/home.dart';
import 'package:presently/screens/login.dart';
import 'package:presently/screens/register.dart';

var routes = <String, WidgetBuilder>{
  'home': (BuildContext context) => HomeScreen(),
  'login': (BuildContext context) => LoginScreen(),
  'register': (BuildContext context) => RegisterScreen(),
  'navbar': (BuildContext context) => PresentlyTabBar()
};
