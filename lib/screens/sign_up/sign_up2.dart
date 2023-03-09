import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../presentations/resources/assets_manager.dart';
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

        /*  leading: GestureDetector(
              onTap: () {},
              child: Container(
                height: 3,
                width: 15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffedefff),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 15,
                    ),
                    Text(
                      AppStrings.back.tr(),
                      style: getRegularStyle(color: Color(0xff777374)),
                    ),
                  ],
                ),
              ),
            ),*/
      ),

      body: Container(
        height: double.infinity,
        padding: EdgeInsetsDirectional.only(top: 40,start: 10,end: 10),
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
                    }
                ),
                SizedBox(
                  height: 20,
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
                  suffix:isPassword? Icons.visibility: Icons.visibility_off,
                  suffixPressed: (){
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: defaultButton(function: (){}, text: AppStrings.login.tr().toUpperCase(),color: Color(0xff4b4eb0),radius: 20),
                ),
                SizedBox(height: 30,),
                Text(AppStrings.orSign.tr()),
                SizedBox(height: 15,),
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
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.notMember.tr()),
                    SizedBox(width: 4,),
                    Text(AppStrings.registerNow.tr(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
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