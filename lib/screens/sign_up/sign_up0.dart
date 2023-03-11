
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 20,
      title: Row(
        children: [
          Text(
            AppStrings.login.tr(),
            style: getBoldStyle(
              color: Colors.black,
            ),
          ),

          Spacer(),
          backButton()
        ],
      ),
    ),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            children: [
              RoundedLoadingButton(controller:googleController ,color: Colors.white ,
                 // width: size.width,
                  width: 400,
                   onPressed: (){},
                  child: Wrap(
                    alignment: WrapAlignment.start ,
                children: [
                  Image(
                  image: AssetImage(ImageAssets.googleIcon),
                    height: 30,
                    width: 25,
                  ),
                  SizedBox(width: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppStrings.withGoogle.tr(),style: TextStyle(color: Colors.black,fontSize: 15),),
                  )
                ],
              )),
              SizedBox(height: 15,),
              RoundedLoadingButton(controller:facebookController ,color: Colors.white ,
                  // width: size.width,
                  width: 400,
                  onPressed: (){},
                  child: Wrap(
                    children: [
                      Image(

                        image: AssetImage(ImageAssets.facebookIcon),
                        height: 30,
                        width: 25,
                      ),
                      SizedBox(width: 15,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppStrings.withFacebook.tr(),style: TextStyle(color: Colors.black,fontSize: 15),),
                      )
                    ],
                  )),
              SizedBox(height: 15,),
              RoundedLoadingButton(controller:iphoneController ,color: Colors.white ,
                  // width: size.width,
                  width: 400,
                  onPressed: (){},
                  child: Wrap(
                    children: [
                      Image(
                        image: AssetImage(ImageAssets.appleIcon),
                        height: 30,
                        width: 25,
                      ),
                      SizedBox(width: 15,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppStrings.withIphone.tr(),style: TextStyle(color: Colors.black,fontSize: 15),),
                      )
                    ],
                  )),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(
                  child: Divider(
                    thickness: 4,
                    color: Color(0xffEEEFFF),
                  )),
              Text(AppStrings.or.tr()),
              Expanded(
                  child: Divider(
                    thickness: 4,
                    color: Color(0xffEEEFFF),
                  ))
            ],
          ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultButton(function: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => loginScreen()));
                }, text: AppStrings.loginPassword.tr().toUpperCase(),color: Color(0xff4b4eb0),radius: 20),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.notMember.tr()),
                  SizedBox(width: 4,),
                  TextButton(onPressed: () {Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => CreateAcoount())); },
                  child: Text(AppStrings.registerNow.tr(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      )

    );
  }
}