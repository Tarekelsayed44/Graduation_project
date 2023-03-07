import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';

class SignUp0 extends StatefulWidget {
  const SignUp0({Key? key}) : super(key: key);

  @override
  State<SignUp0> createState() => _SignUp0State();
}

class _SignUp0State extends State<SignUp0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.login.tr(),style: getBoldStyle(color: Colors.black,fontSize: 40),),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle
                
            ),
            child: Row(
              children: [
                //Image,
                Text(AppStrings.withGoogle,style: getRegularStyle(color: Colors.black),)
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
