import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/screens/settings/settings.dart';

import '../../presentations/resources/assets_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import '../../shared/components/component.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title: Text(
          AppStrings.login.tr(),
          style: getBoldStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsetsDirectional.only(top: 40, start: 10, end: 10),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: AppStrings.emailHint.tr(),
                    prefix: Icons.email,
                    validate: (value) {
                      if (value.isEmpty) {
                        return AppStrings.invalidEmail.tr();
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  controller: passwordController,
                  validate: (value) {
                    if (value.isEmpty) {
                      return AppStrings.passwordError.tr();
                    }
                    return null;
                  },
                  onSubmit: () {
                    if (formKey.currentState!.validate()) {
                      return "invalid";
                    }
                  },
                  type: TextInputType.visiblePassword,
                  label: AppStrings.password.tr(),
                  prefix: Icons.lock,

                  suffix: isPassword==true ? Icons.visibility : Icons.visibility_off,
                  suffixPressed: () {
                    isPassword==true ? Icons.visibility : Icons.visibility_off;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () { Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => loginScreen()));
                      },
                        child:Text( AppStrings.forgetPassword.tr(), style: getMediumStyle(color: Color(0xff4b4eb0))) ,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (newValue) {
                            setState(() {
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
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: defaultButton(
                      function: () { Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => settings()));
                        },
                      text: AppStrings.login.tr().toUpperCase(),
                      color: Color(0xff4b4eb0),
                      radius: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xff4b4eb0),
                        )),
                    Text(AppStrings.or.tr()),
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xff4b4eb0),
                        ))
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage(ImageAssets.googleIcon),
                      height: 48,
                      width: 48,
                    ),
                    Image(
                      image: AssetImage(ImageAssets.facebookIcon),
                      height: 48,
                      width: 48,
                    ),
                    Image(
                      image: AssetImage(ImageAssets.appleIcon),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
