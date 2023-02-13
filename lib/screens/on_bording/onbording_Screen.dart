import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/screens/login_screen/login_screen.dart';
import 'package:pick_park/shared/components/component.dart';

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
                    child: Image.asset(ImageAssets.onboardingLogo1),
                    margin: EdgeInsetsDirectional.all(20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(AppStrings.onBoardingTitle1.tr(),
                      textAlign: TextAlign.center,
                      style: getBoldStyle(color: Colors.black)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(AppStrings.onBoardingSubTitle1.tr(),
                      textAlign: TextAlign.center,
                      style: getMediumStyle(color: Colors.black)),
                  SizedBox(
                    height: 30,
                  ),
                  dotview(),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    function: () {
                      nextPage.animateToPage(1,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeIn);
                    },
                    text: AppStrings.next.tr(),
                    color: Color(0xff4b4eb0),
                    radius:25,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginScreen()));
                    },
                    text: AppStrings.skip.tr(),
                    textColor: Color(0xff8993fa),
                    color: Color(0xffedefff),
                    radius:25,
                  ), // button2
                ],
              ),
            ),
            //page1
            SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(ImageAssets.onboardingLogo2),
                    margin: EdgeInsetsDirectional.all(30),
                  ), //photo
                  SizedBox(
                    height: 55,
                  ),
                  Text(AppStrings.onBoardingTitle2.tr(),
                      textAlign: TextAlign.center,
                      style: getBoldStyle(color: Colors.black)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(AppStrings.onBoardingSubTitle2.tr(),
                      textAlign: TextAlign.center,
                      style: getMediumStyle(color: Colors.black)),
                  SizedBox(
                    height: 35,
                  ),
                  dotview(),
                  SizedBox(
                    height: 17,
                  ),
                  defaultButton(
                    function: () {
                      nextPage.animateToPage(2,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeIn);
                    },
                    text: AppStrings.next.tr(),
                    color: Color(0xff4b4eb0),
                    radius:25,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginScreen()));
                    },
                    text: AppStrings.skip.tr(),
                    textColor: Color(0xff8993fa),
                    color: Color(0xffedefff),
                    radius:25,
                  ), // button2
                ],
              ),
            ),
            //page2
            SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(ImageAssets.onboardingLogo3),
                    margin: EdgeInsetsDirectional.all(20),
                  ), //photo
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppStrings.onBoardingTitle3.tr(),
                    textAlign: TextAlign.center,
                    style: getBoldStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(AppStrings.onBoardingSubTitle3.tr(),
                      textAlign: TextAlign.center,
                      style: getMediumStyle(color: Colors.black)),
                  SizedBox(
                    height: 30,
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
                    color: Color(0xff4b4eb0),
                    radius:25,
                  ), //button1
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginScreen()));
                    },
                    text: AppStrings.skip.tr(),
                    textColor: Color(0xff8993fa),
                    color: Color(0xffedefff),
                    radius:25,
                  ), // button2 //button2
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