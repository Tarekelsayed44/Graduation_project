import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../presentations/resources/assets_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import 'payment2.dart';

class Payment1 extends StatefulWidget {
  const Payment1({Key? key}) : super(key: key);

  @override
  State<Payment1> createState() => _Payment1State();
}

class _Payment1State extends State<Payment1> {
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          AppStrings.choosingPay.tr(),
          style: getSemiBoldStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
          child: Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 62,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Color(0xff4B4EB0),
                            value: checkBoxValue,
                            onChanged: (newValue) {
                              setState(() {
                                checkBoxValue = newValue!;
                              });
                            },
                            shape: CircleBorder(
                                side: BorderSide(style: BorderStyle.solid)),
                          ),
                          Spacer(),
                          Text(
                            AppStrings.paypal,
                            style: getRegularStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(ImageAssets.paypalIcon),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 62,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Color(0xff4B4EB0),
                            value: checkBoxValue2,
                            onChanged: (newValue) {
                              setState(() {
                                checkBoxValue2 = newValue!;
                              });
                            },
                            shape: CircleBorder(
                                side: BorderSide(style: BorderStyle.solid)),
                          ),
                          Spacer(),
                          Text(
                            AppStrings.googlePay,
                            style: getRegularStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(ImageAssets.googleIcon),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 62,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Color(0xff4B4EB0),
                            value: checkBoxValue3,
                            onChanged: (newValue) {
                              setState(() {
                                checkBoxValue3 = newValue!;
                              });
                            },
                            shape: CircleBorder(
                                side: BorderSide(style: BorderStyle.solid)),
                          ),
                          Spacer(),
                          Text(
                            AppStrings.applePay,
                            style: getRegularStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(ImageAssets.appleIcon),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: defaultButton(
                    function: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                    },
                    text: AppStrings.addCard.tr(),
                    color: Colors.white,
                    borderColor: Color(0xff4B4EB0),
                    textColor: Color(0xff4B4EB0),
                    isUpperCase: true,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ) ,
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: defaultButton(
                    function: () {},
                    text: AppStrings.containue.tr(),
                    color: Color(0xff4B4EB0),
                    borderColor: Color(0xff4B4EB0),
                    isUpperCase: true,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
