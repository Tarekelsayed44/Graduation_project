import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'dart:math' as math;
import '../../app/app.dart';
import '../../app/app_pref.dart';
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
             /* ListTile(
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
*/
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(AppStrings.logout.tr(),
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.home),label: AppStrings.home.tr()),
              BottomNavigationBarItem(icon:Icon(Icons.list_alt),label: AppStrings.book.tr()),
              BottomNavigationBarItem(icon:Icon(Icons.bookmark),label: AppStrings.favourite.tr()),
              BottomNavigationBarItem(icon:Icon(Icons.directions_car),label: AppStrings.theCar.tr()),
              BottomNavigationBarItem(icon:Icon(Icons.person),label: AppStrings.account.tr()),

            ],
          ),
        );

  }

  _changelanguage() {

    Phoenix.rebirth(context);
  }
  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }
}
