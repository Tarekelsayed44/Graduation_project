import 'package:flutter/material.dart';
import '../../presentations/resources/assets_manager.dart';

class Splash1 extends StatelessWidget {
  Splash1({Key? key}) : super(key: key);

  @override
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