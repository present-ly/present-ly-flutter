import 'package:flutter/material.dart';
import 'package:presently/routes.dart';
import 'package:presently/screens/login.dart';
import 'package:presently/theme.dart';

main() => runApp(Presently());

class Presently extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Presently",
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: presentlyThemeData,
      home: LoginScreen(),
    );
  }
}
