import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/splash/splash1.dart';
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
     home:Splash1(),
      theme: ThemeData(),
    );
  }
}