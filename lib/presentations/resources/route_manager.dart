import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/Main/home/home_screen.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';

import '../Main/main_view.dart';
import '../login_screen/login_screen.dart';
import '../on_bording/onbording_Screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
}
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
    //  case Routes.splashRoute:
      //  return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        //initLoginModule();
        return MaterialPageRoute(builder: (_) => loginScreen());
     case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoording());
     case Routes.registerRoute:
        //initRegisterModule();
        //return MaterialPageRoute(builder: (_) => RegisterView());
     // case Routes.forgotPasswordRoute:
       // initForgotPasswordModule();
        //return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
       // initHomeModule();
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.noRouteFound).tr(),
          ),
          body: Center(child: Text(AppStrings.noRouteFound).tr()),
        ));
  }
}