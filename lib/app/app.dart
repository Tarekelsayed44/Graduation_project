import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_park/screens/login_screen/login_screen.dart';
import 'package:pick_park/screens/sign_up/auth/auth_cubit.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/payment_screens/payment1.dart';
import '../screens/splash/splash1.dart';
import '../shared/components/constants.dart';
class MyApp extends StatefulWidget {
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
    return MultiBlocProvider(providers:[ BlocProvider(create: (context)=>AuthCubit()),], child:

      MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      //onGenerateRoute: RouteGenerator.getRoute,
     // initialRoute: Routes.loginRoute,
        home: Splash1(),
    // home:token != null ? const HomeScreen() : loginScreen(),
      theme: ThemeData(),
      )

    );
  }
}