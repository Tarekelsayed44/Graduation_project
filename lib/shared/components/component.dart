import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';

import '../../presentations/details/details.dart';

Widget defaultButton({
  Color color = Colors.blue,
  required Function function,
  required String text,
  double radius = 25,
  double fontSize = 20,
  double height = 51.2,
  FontWeight fontWeight = FontWeight.w500,
  bool isUpperCase = true,
  Color borderColor = Colors.purple,
  Color textColor = Colors.white,
}) =>
    Container(
      width: 314,
      height: height,
      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: 2, color: borderColor),
        color: color,
      ),
    );
//-------------------------------------------------------------------------------------------
Widget defaultTextButton({required Function function, required String text}) =>
    TextButton(onPressed: () => function(), child: Text(text.toUpperCase()));
//---------------------------------------------------------------------------------------------------
Widget defaultFormField(
        {required TextEditingController controller,
        TextInputType? type,
        Function? onchange,
        validate,
        double radius = 20.0,
        int max = 1,
        required String label,
        required IconData? prefix,
        IconData? suffix,
        bool isPassword = false,
        Function? suffixPressed,
        Function? onSubmit,
        var autoValidate = AutovalidateMode.onUserInteraction,
        IconButton? suffixIcon,
        Function? onTap}) =>
    TextFormField(
      validator: validate,
      maxLines: max,
      autovalidateMode: autoValidate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: (value) {
        onchange;
      },
      onTap: () {},
      onFieldSubmitted: (String value) {
        onSubmit!(value);
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        prefixIcon: Icon(
          prefix,
        ),
      ),
    );
//-----------------------------------------------------------------------------------------------
Widget backButton({
  Function? function,
}) =>
    GestureDetector(
      onTap: () {
        Navigator.pop;
      },
      child: Container(
        width: 89,
        height: 28,
        decoration: BoxDecoration(
          color: Color(0xffEDEFFF),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 15),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                AppStrings.back.tr(),
                style: TextStyle(
                  color: Color(0xff736F6F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Cairo",
                ),
              ),
            ],
          ),
        ),
      ),
    );

void showAlertDialog(
    {required BuildContext context,
    required Color backgroundColor,
    required Widget content,
    List<Widget>? actions}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          elevation: 0,
          alignment: AlignmentDirectional.center,
          content: Padding(
              padding: EdgeInsets.symmetric(vertical: 1), child: content),
          actions: actions,
        );
      });
}

OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 2.0));
//--------------------------------------------------------------------------------------------------
Future showProfileSheet({
  var context,
}) =>
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.details.tr(),
                style: getRegularStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 221,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Image(image: AssetImage(ImageAssets.car)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                AppStrings.address.tr(),
                style: getRegularStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: defaultButton(
                        function: () {Navigator.pop(context);},
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
                    width: 25,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: defaultButton(
                        function: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                        },
                        text: AppStrings.details.tr(),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        isUpperCase: false,
                        color: Color(0xff4B4EB0)
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      elevation: 3,
      backgroundColor: Colors.white,
    );
