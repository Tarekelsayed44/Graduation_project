import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';

import '../on_bording/onbording_Screen.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2),
            () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => OnBoording())));
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            ImageAssets.splashLogo2,
            height: size.height,
            width: size.width,
            fit:BoxFit.fitHeight,
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.splashText1.tr(),
                  style: getBoldStyle(color: Color(0xff020202),fontSize: 40),textAlign:TextAlign.start,

                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  AppStrings.splashText2,
                  style:getBoldStyle(color: Color(0xff020202),fontSize: 50),textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.splashText3.tr(),
                  style:getBoldStyle(color: Color(0xffF8F8F8),fontSize: 22),textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}