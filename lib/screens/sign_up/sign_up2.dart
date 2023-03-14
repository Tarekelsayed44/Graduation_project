import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/font_manager.dart';
import 'package:pick_park/screens/login_screen/login_screen.dart';
import 'package:pick_park/screens/sign_up/sign_up0.dart';

import '../../presentations/resources/assets_manager.dart';
import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import '../../shared/components/component.dart';
import 'sign_up1.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title: Row(
          children: [
            Text(
              AppStrings.createAcoount.tr(),
              style: getBoldStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          Spacer(),
            // backButton(
            //     function: (){
            //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SignUp0()));
            //
            // })
        ],
      ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsetsDirectional.only(top: 70,start: 10,end: 10),
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
                    validate:(value){
                      if(value.isEmpty){
                        return AppStrings.invalidEmail.tr();
                      }
                      return null;
                    },
                ),
                SizedBox(
                  height: 30,
                ),
                defaultFormField(
                  controller: passwordController,
                  validate:(value){
                    if(value.isEmpty){
                      return  AppStrings.passwordError.tr();
                    }
                    return null;
                  },
                  type: TextInputType.visiblePassword,
                  label: AppStrings.password.tr(),
                  prefix: Icons.lock,
                ),
                SizedBox(
                  height: 10,
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
                      shape: CircleBorder(
                          side: BorderSide(style: BorderStyle.solid)),
                    ),
                    Text(
                      AppStrings.rememberMe.tr(),
                        style: getBoldStyle(color: Colors.black,fontSize: 15)
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: defaultButton(function: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                        builder: (context) => loginScreen()));
                  },
                      text: AppStrings.login.tr().toUpperCase(),color: Color(0xff4b4eb0),fontSize: 18,fontWeight: FontWeightManager.regular),
                ),
                SizedBox(height: 40,),
                Text(AppStrings.orSign.tr(),style: getRegularStyle(color: Colors.black,fontSize: 20),),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage(ImageAssets.googleIcon),
                      height: 29,
                      width: 29,
                    ),
                    Image(
                      image: AssetImage(ImageAssets.facebookIcon),
                      height: 29,
                      width: 29,
                    ),
                    Image(
                      image: AssetImage(ImageAssets.appleIcon),
                      height: 29,
                      width: 29,
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.notMember.tr(),style: getRegularStyle(color: Colors.black,fontSize: 15),),
                    SizedBox(width: 4,),
                    TextButton(onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => Register_form())); },
                    child: Text(AppStrings.registerNow.tr(),style:getRegularStyle(color: Color(0xff4D5DFA),fontSize: 15) ))
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