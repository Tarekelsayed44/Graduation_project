import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pick_park/screens/login_screen/login_screen.dart';
import 'package:pick_park/screens/splash/splash1.dart';
import 'package:pick_park/shared/styles/theme.dart';

import '../presentations/resources/route_manager.dart';
import 'app_pref.dart';
import 'di.dart';
class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();
  int appState = 0;
  static final MyApp _instance = MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance; // factory
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      //onGenerateRoute: RouteGenerator.getRoute,
     // initialRoute: Routes.loginRoute,
     home: loginScreen(),
      theme: ThemeData(),
    );
  }
}