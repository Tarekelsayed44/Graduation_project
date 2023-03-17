import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/screens/on_bording/onbording_Screen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../presentations/resources/assets_manager.dart';
import '../../shared/components/component.dart';
import '../login_screen/login_screen.dart';
import 'sign_up1.dart';
import 'sign_up2.dart';

class SignUp0 extends StatefulWidget {
  const SignUp0({Key? key}) : super(key: key);

  @override
  State<SignUp0> createState() => _SignUp0State();
}

class _SignUp0State extends State<SignUp0> {
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController iphoneController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          automaticallyImplyLeading:false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              backButton(),
              Spacer(),
              Text(
                AppStrings.login.tr().toUpperCase(),
                style: getBoldStyle(
                  color: Colors.black,
                  fontSize: 27
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
            child: Column(
              children: [
                RoundedLoadingButton(
                  controller: googleController,
                  color: Colors.white,
                  elevation: 0.5,
                  width: double.infinity,
                  borderRadius: 19,
                  height: 66,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(ImageAssets.googleIcon),
                          height: 29,
                          width: 29,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppStrings.withGoogle.tr(),
                          style: getRegularStyle(
                              color: Colors.black, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedLoadingButton(
                    controller: facebookController,
                    color: Colors.white,
                    elevation: 0.5,
                    borderRadius: 19,
                    height: 66,
                    width: double.infinity,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(ImageAssets.facebookIcon),
                            height: 29,
                            width: 29,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            AppStrings.withFacebook.tr(),
                            style: getRegularStyle(
                                color: Colors.black, fontSize: 18),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                RoundedLoadingButton(
                    controller: iphoneController,
                    elevation: 0.5,
                    color: Colors.white,
                    width:double.infinity,
                    borderRadius: 19,
                    height: 66,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(ImageAssets.appleIcon),
                            height: 29,
                            width: 29,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            AppStrings.withIphone.tr(),
                            style: getRegularStyle(color: Colors.black,fontSize:18 ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 4,
                      color: Color(0xffEEEFFF),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 7),
                      child: Text(AppStrings.or.tr(),style: getBoldStyle(color: Color(0xff6F6F6F),fontSize: 18),),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 4,
                      color: Color(0xffEEEFFF),
                    ))
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                defaultButton(
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    },
                    text: AppStrings.loginPassword.tr().toUpperCase(),
                    color: Color(0xff4b4eb0),

                    ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.notMember.tr()),
                    SizedBox(
                      width: 4,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                        },
                        child: Text(
                          AppStrings.registerNow.tr(),
                          style: getRegularStyle(color: Color(0xff4D5DFA,),fontSize: 15)
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
