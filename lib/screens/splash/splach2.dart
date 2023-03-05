import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
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
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.splashText1.tr(),
                  style: getBoldStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  AppStrings.splashText2,
                  style:getBoldStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  AppStrings.splashText3.tr(),
                  style:getBoldStyle(color: Colors.white),
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