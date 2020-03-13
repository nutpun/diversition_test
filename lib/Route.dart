import 'package:diversition_test/Detail.dart';
import 'package:diversition_test/Home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (BuildContext context) => Home());
         case "/detail":
        return MaterialPageRoute(builder: (BuildContext context) => Detail());

      default:
        return MaterialPageRoute(builder: (BuildContext context) => Home());
    }
  }
}
