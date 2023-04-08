import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'dart:math' as math;
import '../../../app/app_pref.dart';
import '../../resources/language_manager.dart';
import '../../resources/string_manager.dart';
//final instance = GetIt.instance;
class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
 // final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.account.tr()),
            Icon(Icons.keyboard_control),

          ],
        ),
        
      ),
      body:
           ListView(
            padding: EdgeInsets.all(22),
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(AppStrings.changeAccount.tr()),
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text(AppStrings.paymentMethods.tr()),

              ),
              ListTile(
                leading:Icon(Icons.notifications) ,
                title: Text(AppStrings.notifications.tr()),
              ),
              ListTile( leading:Icon(Icons.lock) ,
                title: Text(AppStrings.privacy.tr()),),
              ListTile(
                leading:Icon(Icons.error) ,
                title: Text(AppStrings.contactUs.tr()),
              ),
              ListTile(
                leading:Icon(Icons.visibility) ,
                title: Text(AppStrings.darkAppearance.tr()),
              ),
              // ListTile(
              //   leading: Icon(Icons.language),
              //   title: Text(AppStrings.changeLanguage.tr()),
              //   trailing: Transform(
              //     alignment: Alignment.center,
              //     transform: Matrix4.rotationY( isRtl() ? math.pi : 0),
              //   ),
              //   onTap: () {
              //     _changelanguage();
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(AppStrings.logout.tr(),
                ),
              )
            ],
          ),
        );

  }

  // _changelanguage() {
  //   _appPreferences.changeAppLanguage();
  //   Phoenix.rebirth(context);
  // }
  // bool isRtl() {
  //   return context.locale == ARABIC_LOCAL;
  // }
}
