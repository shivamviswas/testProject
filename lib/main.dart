import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/view/screens/home_screen.dart';

import 'controller/api_config/api_config.dart';
import 'controller/providers/university_provider.dart';
import 'controller/utils/app_colors.dart';
import 'controller/utils/app_routs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiConfig.setEnvironment(Environment.DEV);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UniversityProvider(),
        ),
      ],
      child:  MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        title: ApiConfig.name,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
        initialRoute: AppRoutes.homeScreen,
        routes: {
          AppRoutes.homeScreen: (context) => const HomeScreen(),
          // AppRoutes.SPLASH_ROUTE: (context) => const SplashScreen(),
        },
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
    );
  }
}
