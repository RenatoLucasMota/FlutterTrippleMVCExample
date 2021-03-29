import 'package:flutter/material.dart';
import 'package:mvc_example/core/injection.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injection.init();
  runApp(App());
}
