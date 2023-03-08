import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import '../../shared/components/component.dart';

class CreateAcoount extends StatefulWidget {
  const CreateAcoount({Key? key}) : super(key: key);

  @override
  State<CreateAcoount> createState() => _CreateAcoountState();
}

class _CreateAcoountState extends State<CreateAcoount> {
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
          AppStrings.createAcoount.tr(),
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
                    radius: 20,
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
                  type: TextInputType.visiblePassword,
                  label: AppStrings.password.tr(),
                  prefix: Icons.lock,
                  isPassword: isPassword,
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  radius: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: checkBoxValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkBoxValue = newValue!;
                        });
                      },
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: defaultButton(
                      function: () {},
                      text: AppStrings.login.tr().toUpperCase(),
                      color: Color(0xff4b4eb0),
                      radius: 20),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
