import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/screens/login_screen/login_screen.dart';
import 'package:pick_park/shared/components/component.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              AppStrings.forgetPassword.tr(),
              style: getSemiBoldStyle(color: Colors.black, fontSize: 25),
            ),
            Spacer(),
            backButton(
              function: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => loginScreen()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                ImageAssets.forgetPass,
                width: 173,
                height: 173,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.forgetPassTitle.tr(),
                style: getRegularStyle(color: Colors.black, fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 362,
                  height: 131,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.massage.tr(),
                          style:
                              getRegularStyle(color: Colors.black, fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xffEDEFFF),
                              child: Image.asset(
                                ImageAssets.massage,
                                height: 34,
                                width: 35,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              AppStrings.phone.tr(),
                              style: getRegularStyle(
                                  color: Colors.black, fontSize: 19),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 362,
                  height: 131,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.emailHint.tr(),
                          style:
                              getRegularStyle(color: Colors.black, fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xffEDEFFF),
                              radius: 30,
                              child: Image.asset(
                                ImageAssets.email,
                                height: 34,
                                width: 35,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              AppStrings.emailEx.tr(),
                              style: getRegularStyle(
                                  color: Colors.black, fontSize: 19),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              defaultButton(
                  function: () {},
                  text: AppStrings.containue.tr(),
                  color: Color(0xff4B4EB0),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  isUpperCase: true)
            ],
          ),
        ),
      ),
    );
  }
}
