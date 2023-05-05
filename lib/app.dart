import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_park/presentations/splash/splash1.dart';
import 'package:pick_park/shared/components/constants.dart';
import 'presentations/Main/main_view.dart';
import 'presentations/Main/settings/settings.dart';
import 'presentations/booking_details/booking_details.dart';
import 'presentations/payment_screens/payment2.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'presentations/sign_up/sign_up1.dart';
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
    // return MultiBlocProvider(providers:[ BlocProvider(create: (context)=>AuthCubit()),], child:
    final HttpLink httpLink = HttpLink('https://fe07-156-207-187-103.ngrok-free.app/graphql');
     final AuthLink authLink = AuthLink(
       getToken: () async => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiY2MzYzZiOS0zN2M4LTRkNTYtYmY2OC1iNjEyM2E2YmYzMGUiLCJpYXQiOjE2ODMyOTMxNDR9.yEuS70FjzkaKBgWe93DUTvVPUVnVtnYk6UqIYWoN_ic',
     );
  //  final Link link = authLink.concat(httpLink);
    ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache:
        GraphQLCache(),
      ),
    );

    return GraphQLProvider(
        client: client,
     child: MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      //onGenerateRoute: RouteGenerator.getRoute,
     // initialRoute: Routes.loginRoute,
        home:Register_form(),
    // home:token != null ? const HomeScreen() : loginScreen(),
      theme: ThemeData(),
     )
      );

  }
}