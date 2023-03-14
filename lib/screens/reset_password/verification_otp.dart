import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pick_park/screens/forget_password/forget_pass.dart';

import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import '../../shared/components/component.dart';
class verificationOtp extends StatefulWidget {
  const verificationOtp({Key? key}) : super(key: key);

  @override
  State<verificationOtp> createState() => _verificationOtpState();
}

class _verificationOtpState extends State<verificationOtp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title: Row(
          children: [
            Text(
              AppStrings.forgetPassword.tr(),
              style: getBoldStyle(
                color: Colors.black,
              ),
            ),
            Spacer(),
            backButton(
              function: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => ForgetPass()));
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  }
                ),
              ),  SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  }
                ),
              ),  SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                    textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  }
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    }
                ),
              ),
            ],
          ),
          Spacer(),
          defaultButton(function: (){}, text: AppStrings.containue.tr()),
        ],
      ),
    );
  }
}
