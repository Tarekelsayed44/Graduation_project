import 'package:flutter/material.dart';

import '../../presentations/resources/assets_manager.dart';

class splash1 extends StatelessWidget {
  const splash1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image:AssetImage(ImageAssets.splashLogo1)),
    );
  }
}
