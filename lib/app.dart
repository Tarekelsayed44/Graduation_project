import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_park/presentations/Main/tags/tags.dart';
import 'package:pick_park/presentations/Main/the%20vehicle/create_vehicle.dart';
import 'package:pick_park/presentations/send_email/send_email.dart';
import 'package:pick_park/presentations/splash/splash1.dart';
import 'package:pick_park/shared/components/constants.dart';
import 'presentations/Main/main_view.dart';
import 'presentations/Main/settings/settings.dart';
import 'presentations/Main/the vehicle/vehicle_screen.dart';
import 'presentations/booking_details/booking_details.dart';
import 'presentations/login_screen/login_screen.dart';
import 'presentations/payment_screens/payment2.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'presentations/reset_password/resetPassword.dart';
import 'presentations/sign_up/sign_up1.dart';
import 'presentations/sign_up/verified_email/email_verification.dart';


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
    final HttpLink httpLink = HttpLink('https://pickpark-api.onrender.com/graphql');
     final AuthLink authLink = AuthLink(
       getToken: () async => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiY2MzYzZiOS0zN2M4LTRkNTYtYmY2OC1iNjEyM2E2YmYzMGUiLCJpYXQiOjE2ODMyOTMxNDR9.yEuS70FjzkaKBgWe93DUTvVPUVnVtnYk6UqIYWoN_ic',
     );
    final Link link = authLink.concat(httpLink);
    ValueNotifier<GraphQLClient> gclient = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
        client: gclient,
     child: MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      //onGenerateRoute: RouteGenerator.getRoute,
     // initialRoute: Routes.loginRoute,
        home:Splash1(),
    // home:token != null ? const HomeScreen() : loginScreen(),
      theme: ThemeData(),
     )
      );

  }
}