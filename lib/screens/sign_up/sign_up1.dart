import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';

class Register_form extends StatefulWidget {
  const Register_form({Key? key}) : super(key: key);

  @override
  State<Register_form> createState() => _Register_formState();
}

class _Register_formState extends State<Register_form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text(AppStrings.fillForm.tr()),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 15,
                  ),
                  Text(
                    AppStrings.back.tr(),
                    style: getRegularStyle(color: Color(0xff777374)),
                  ),
                ],
              )
            ],
          ),
          defaultFormField(
              controller: TextEditingController(),
              type: TextInputType.name,
              label: AppStrings.fullName.tr(),
              prefix: Icons.person),
        ],
      ),
    );
  }
}
