import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/shared/components/component.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool checkBoxValue = false;
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Spacer(),
            Text(
              AppStrings.resetPassword.tr(),
              style: getBoldStyle(
                color: Colors.black,
              ),
            ),


          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Image(
                      image: AssetImage(ImageAssets.resetpass),
                      width: 198,
                      height: 181,
                    )),
                SizedBox(
                  height: 25,
                ),
                Text(
                  AppStrings.resetPassword2.tr(),
                  style: getBoldStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 25,
                ),
                defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: AppStrings.emailHint.tr(),
                  prefix: Icons.email,
                ),
                SizedBox(
                  height: 25,
                ),
                defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  label: AppStrings.password.tr(),
                  prefix: Icons.lock,

                  suffixPressed: (){
                    Icons.remove_red_eye;
                    setState(() {
                      isPassword  = !isPassword;
                    });
                    Icon(isPassword ? Icons.visibility : Icons.visibility_off);
                  }
                ),
                Row(
                  children: [
                    Checkbox(
                      value: checkBoxValue,
                      onChanged: (newValue) {
                        setState((){
                          checkBoxValue = newValue!;
                        });
                      },
                      // checkColor: Color(0xff4b4eb0),
                      shape: CircleBorder(
                          side: BorderSide(style: BorderStyle.solid)),
                    ),
                    Text(
                      AppStrings.rememberMe.tr(),
                      style: getMediumStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                defaultButton(
                  function: () {},
                  text: AppStrings.containue.tr(),
                  color: Color(0xff4b4eb0),
                  textColor: Colors.white,
                  radius: 35,
                  isUpperCase: true,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}