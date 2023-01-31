import 'package:flutter/material.dart';
Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  required Function function,
  required String text,
  double radius = 0.0,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
    );

Widget defaultTextButton({required Function function, required String text}) =>
    TextButton(onPressed: () => function(), child: Text(text.toUpperCase()));
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onchange,
  validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  Function? onSubmit,
  var autoValidate = AutovalidateMode.onUserInteraction,
}) =>
    TextFormField(
      validator: validate,
      autovalidateMode: autoValidate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: (value) {
        onchange;
      },
      onFieldSubmitted: (String value) {
        onSubmit!(value);
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        ),
      ),
    );
