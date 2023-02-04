import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';

import '../../app/app_pref.dart';
import '../../app/di.dart';
import '../../shared/components/component.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Text(AppStrings.login.tr()),
                Icon(Icons.arrow_back)
              ],
            ),
            defaultFormField(
              type: TextInputType.emailAddress,
              label: AppStrings.emailHint.tr(),
              prefix: Icons.email, controller: TextEditingController(),
            ),
            SizedBox(height: 15,),
            defaultFormField(
              type: TextInputType.visiblePassword,
              prefix: Icons.lock,
              suffix: Icons.remove_red_eye, controller: TextEditingController(),
              label: AppStrings.password.tr(),
            ),
          ],
        )
    );
  }
}

