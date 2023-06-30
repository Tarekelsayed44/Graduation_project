import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/payment_screens/payment1.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';

import '../../shared/components/component.dart';
import '../Main/the vehicle/vehicle_screen.dart';
import '../resources/assets_manager.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppStrings.parkingDetail.tr(),
          style: getBoldStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: size.height / 3,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: Image(image: AssetImage(ImageAssets.car)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                AppStrings.detailText.tr(),
                style: getSemiBoldStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: defaultButton(
                        function: () {},
                        text: '3 Km',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        textColor: Color(0xff4B4EB0),
                        color: Colors.white,
                        isUpperCase: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: defaultButton(
                      function: () {},
                      text: '8AM-10PM',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      textColor: Color(0xff4B4EB0),
                      color: Colors.white,
                      isUpperCase: false,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: defaultButton(
                        function: () {},
                        text: 'خادم',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        textColor: Color(0xff4B4EB0),
                        color: Colors.white,
                        isUpperCase: false,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                AppStrings.description.tr(),
                style: getSemiBoldStyle(color: Colors.black, fontSize: 17),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: defaultButton(
                          function: () {},
                          text: AppStrings.cancel.tr(),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          textColor: Color(0xff4B4EB0),
                          color: Colors.white,
                          isUpperCase: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: defaultButton(
                            function: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleScreen()));
                            },
                            text: AppStrings.toBooking.tr(),
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            isUpperCase: false,
                            color: Color(0xff4B4EB0)
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
