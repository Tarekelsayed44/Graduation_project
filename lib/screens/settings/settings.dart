import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dart:math' as math;
import '../../app/app.dart';
import '../../app/app_pref.dart';
import '../../app/di.dart';
import '../../presentations/resources/language_manager.dart';
import '../../presentations/resources/string_manager.dart';
class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        //padding: EdgeInsets.all(22),
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text(AppStrings.changeLanguage.tr()),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY( isRtl() ? math.pi : 0),
            ),
            onTap: () {
              _changelanguage();
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text(AppStrings.logout.tr(),
            ),
          )
        ],
      ),
    );
  }

  _changelanguage() {
    // i will implement it later
    Phoenix.rebirth(context);
  }
  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }
//  _contactUs() {
// its a task for you to open any webpage using URL
// }
}
