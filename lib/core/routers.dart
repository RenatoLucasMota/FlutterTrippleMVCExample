import 'package:flutter/material.dart';
import 'package:mvc_example/src/views/home/home_page.dart';

import 'injection.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => HomePage(Injection.i.get()));
        break;
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }
}
