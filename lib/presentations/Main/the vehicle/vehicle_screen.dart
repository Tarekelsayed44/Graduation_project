import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../payment_screens/payment2.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';
import 'create_vehicle.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {

  bool checkBoxValue = false;
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          AppStrings.chooseVehicle.tr(),
          style: getBoldStyle(color: Colors.black, fontSize: 20),
        ),
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
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
                      Column(
                        children: [
                          Text('Toyota Corolla',style: getRegularStyle(color: Color(0xff4B4EB0),fontSize: 18),),
                          Text('HG 4676 FH',style: getRegularStyle(color: Colors.black,fontSize: 12),)
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(ImageAssets.carya),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Color(0xff4B4EB0),
                        value: checkBoxValue1,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue = newValue!;
                          });
                        },
                        shape: CircleBorder(
                            side: BorderSide(style: BorderStyle.solid)),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('Ford Series',style: getRegularStyle(color: Color(0xff4B4EB0),fontSize: 18),),
                          Text('AF 4793 JU',style: getRegularStyle(color: Colors.black,fontSize: 12),)
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(ImageAssets.carya),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Color(0xff4B4EB0),
                        value: checkBoxValue2,
                        onChanged: (newValue) {
                          setState(() {
                            checkBoxValue = newValue!;
                          });
                        },
                        shape: CircleBorder(
                            side: BorderSide(style: BorderStyle.solid)),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('Honda Civic',style: getRegularStyle(color: Color(0xff4B4EB0),fontSize: 18),),
                          Text('HU 3691 KO',style: getRegularStyle(color: Colors.black,fontSize: 12),)
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                     Image(image: AssetImage(ImageAssets.carya),)
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: defaultButton(
                    function: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatevehiclePage()));
                    },
                    text: AppStrings.createVehicle.tr(),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    textColor: Color(0xff4B4EB0)),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: defaultButton(
                  function: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPaymentCard()));
                  },
                  text: AppStrings.containue.tr(),
                  color: Color(0xff4B4EB0),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}