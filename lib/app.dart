import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_park/presentations/Main/home/home_screen.dart';
import 'package:pick_park/presentations/Main/tags/tags.dart';
import 'package:pick_park/presentations/Main/the%20vehicle/create_vehicle.dart';
import 'package:pick_park/presentations/details/details.dart';
import 'package:pick_park/presentations/final_detail/finalDetail.dart';
import 'package:pick_park/presentations/forget_password/forget_pass.dart';
import 'package:pick_park/presentations/reset_password/verification_otp.dart';
import 'package:pick_park/presentations/send_email/send_email.dart';
import 'package:pick_park/presentations/sign_up/sign_up0.dart';
import 'package:pick_park/presentations/splash/splach2.dart';
import 'package:pick_park/presentations/splash/splash1.dart';
import 'package:pick_park/shared/components/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app_pref.dart';
import 'presentations/Main/main_view.dart';
import 'presentations/Main/settings/settings.dart';
import 'presentations/Main/the vehicle/vehicle_screen.dart';
import 'presentations/Search/search.dart';
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
  String token = "";
  Future<void> initAppServices() async {
    TokenCache tokenCache = TokenCache();
    await tokenCache.loadToken();
     token = await  tokenCache.token!;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
     initAppServices();
        final Link httpLink = HttpLink(
          'https://pickpark-api.onrender.com/graphql',
          defaultHeaders:  {
            'Authorization': (token) != null? 'Bearer $token': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI0ODdhNTVkMS03MjUyLTQ1YzEtYWNjYi0xY2EwNjBhZjgzN2YiLCJpYXQiOjE2ODY4NzE4NTl9.bYqQg4YDXpYQ0dnL626S0s9t-j6TW7HR4QyuXek3LKk'
          },
        ).concat(AuthLink(getToken: () async => 'Bearer $token'));
        ValueNotifier<GraphQLClient> gclient = ValueNotifier(
          GraphQLClient(
            link: httpLink,
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
              home:Splash1(),
              theme: ThemeData(),
            )
        );
  }
}