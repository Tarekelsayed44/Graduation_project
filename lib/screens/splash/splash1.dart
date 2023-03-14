import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/route_manager.dart';
import 'package:pick_park/screens/on_bording/onbording_Screen.dart';
import 'package:pick_park/screens/splash/splach2.dart';
import '../../presentations/resources/assets_manager.dart';

class Splash1 extends StatefulWidget {
  Splash1({Key? key}) : super(key: key);

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2),
            () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => IntroScreen())));
  }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo1),
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}