import 'package:flutter/material.dart';
import 'package:test_project/main.dart';

import '../api_config/api_config.dart';

void main() async {
  ApiConfig.setEnvironment(Environment.DEV);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
