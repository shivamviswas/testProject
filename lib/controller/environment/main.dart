import 'package:flutter/material.dart';

import '../../main.dart';
import '../api_config/api_config.dart';

void main() {
  ApiConfig.setEnvironment(Environment.PRODUCTION);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
