import 'package:flutter/material.dart';
import 'package:presently/routes.dart';
import 'package:presently/screens/home.dart';

main() => runApp(Presently());

class Presently extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Presently",
      routes: routes,
      home: HomeScreen(),
    );
  }
}
