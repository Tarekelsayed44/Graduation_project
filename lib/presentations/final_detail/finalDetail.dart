import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/Main/main_view.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/shared/components/component.dart';

class FinalDetail extends StatefulWidget {
  const FinalDetail({Key? key}) : super(key: key);

  @override
  State<FinalDetail> createState() => _FinalDetailState();
}

class _FinalDetailState extends State<FinalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.ensurebook.tr(),
          style: getBoldStyle(color: Colors.black, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('المكان'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('نوع المركبة'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('مكان الركنة'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('التاريخ'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('المدة الزمنية'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('الساعة'),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Text('المشاية السفلية بجوار نادي الحوار'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Ford series (AF 4793 JU)'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('الدور الأول (A05)'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('26 June 2023'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('4 ساعات'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(' 09:00AM - 13:00PM'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: 250,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xffE6E6E6)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text('المجموع'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('الرسوم والضرائب'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('الاجمالي'),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text('25.00'),
                          SizedBox(
                            height: 5,
                          ),
                          Text("2.50"),
                          SizedBox(
                            height: 5,
                          ),
                          Text('27.50'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Row(
                  children: [
                    Text(
                      '*********************',
                      style: getMediumStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.credit_card, color: Color(0xff4B4EB0), size: 25),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("تغيير",style: getRegularStyle(color: Color(0xff4B4EB0),fontSize: 20),))
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
              child: defaultButton(
                  function: () {
                    showAlertDialog(
                        context: context,
                        backgroundColor: Colors.white,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('تم تأكيد الحجز بنجاح'),
                            SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: defaultButton(
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainView()));
                                },
                                text: 'العودة الى الرئيسية',
                                color: Color(0xff4B4EB0),
                              ),
                            )
                          ],
                        ));
                  },
                  text: AppStrings.submit.tr(),
                  color: Color(0xff4B4EB0)),
            )
          ],
        ),
      ),
    );
  }
}
