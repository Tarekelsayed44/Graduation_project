import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/shared/components/component.dart';

import '../sign_up/sign_up0.dart';

class OnBoording extends StatefulWidget {
  const OnBoording({Key? key}) : super(key: key);

  @override
  State<OnBoording> createState() => _OnBoordingState();
}

class _OnBoordingState extends State<OnBoording> {
  PageController nextPage = PageController();
  int pageNumber = 0;

  Widget dotview() {
    return Builder(builder: ((context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              width: i == pageNumber ? 25 : 6,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: i == pageNumber ? Color(0xff4b4eb0) : Colors.grey,
              ),
            )
        ],
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              pageNumber = value;
            });
          },
          controller: nextPage,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      ImageAssets.onboardingLogo1,
                      width: 263.07,
                      height: 263.07,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(AppStrings.onBoardingTitle1.tr(),
                      textAlign: TextAlign.center,
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 30)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(AppStrings.onBoardingSubTitle1.tr(),
                      textAlign: TextAlign.center,
                      style:
                          getRegularStyle(color: Colors.black, fontSize: 18)),
                  SizedBox(
                    height: 40,
                  ),
                  dotview(),
                  SizedBox(
                    height: 10,
                  ),
                  defaultButton(
                    function: () {
                      nextPage.animateToPage(1,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeIn);
                    },
                    text: AppStrings.next.tr(),
                    height: 58,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff4b4eb0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    function: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => SignUp0()));
                    },
                    text: AppStrings.skip.tr(),
                    height: 58,
                    fontWeight: FontWeight.w400,
                    textColor: Color(0xff8993fa),
                    color: Color(0xffedefff),
                  ), // button2
                ],
              ),
            ),
            //page1
            SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      ImageAssets.onboardingLogo2,
                      width: 224.22,
                      height: 192.13,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  ), //photo
                  SizedBox(
                    height: 53,
                  ),
                  Text(AppStrings.onBoardingTitle2.tr(),
                      textAlign: TextAlign.center,
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 30)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(AppStrings.onBoardingSubTitle2.tr(),
                      textAlign: TextAlign.center,
                      style:
                          getRegularStyle(color: Colors.black, fontSize: 18)),
                  SizedBox(
                    height: 40,
                  ),
                  dotview(),
                  SizedBox(
                    height: 10,
                  ),
                  defaultButton(
                    function: () {
                      nextPage.animateToPage(2,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeIn);
                    },
                    text: AppStrings.next.tr(),
                    height: 58,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff4b4eb0),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    function: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => SignUp0()));
                    },
                    text: AppStrings.skip.tr(),
                    fontWeight: FontWeight.w400,
                    height: 58,
                    textColor: Color(0xff8993fa),
                    color: Color(0xffedefff),
                  ), // button2
                ],
              ),
            ),
            //page2
            SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(ImageAssets.onboardingLogo3,
                        width: 258, height: 258),
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                  ), //photo
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppStrings.onBoardingTitle3.tr(),
                    textAlign: TextAlign.center,
                    style: getSemiBoldStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(AppStrings.onBoardingSubTitle3.tr(),
                      textAlign: TextAlign.center,
                      style:
                          getRegularStyle(color: Colors.black, fontSize: 18)),
                  SizedBox(
                    height: 40,
                  ),
                  dotview(),
                  SizedBox(
                    height: 40,
                  ),
                  defaultButton(
                    function: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => SignUp0()));
                    },
                    text: AppStrings.next.tr(),
                    height: 58,
                    color: Color(0xff4b4eb0),
                    radius: 25,
                  ),
                ],
              ),
            ),
            //page3
          ],
        ),
      ),
    );
  }
}
