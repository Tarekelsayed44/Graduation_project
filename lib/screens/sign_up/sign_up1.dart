import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/screens/sign_up/sign_up2.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';

class Register_form extends StatefulWidget {
  const Register_form({Key? key}) : super(key: key);

  @override
  State<Register_form> createState() => _Register_formState();
}

class _Register_formState extends State<Register_form> {
  var nameController = TextEditingController();
  var birthController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selctedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),
        elevation: 0,
        title: Row(
          children: [

            Spacer(),
            Text(AppStrings.fillForm.tr(),style: getBoldStyle(color: Colors.black),),


          ],
        ),
        backgroundColor: Colors.white,

      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(top: 20,start: 10,end: 10),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person_add_outlined, size: 40,),
                ),
                SizedBox(
                  height: 25,
                ),
                defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    label: AppStrings.fullName.tr(),
                    prefix:Icons.person ,
                  radius: 20,
                  validate: (value){
                    if(value.isEmpty){
                      return AppStrings.errorField.tr();
                    }
                    return null;
                  }

                ),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller:birthController ,
                    type: TextInputType.datetime,
                    label: AppStrings.birthDate.tr(),
                    prefix: Icons.calendar_month,
                    validate: (value){
                      if(value.isEmpty){
                        return AppStrings.errorField.tr();
                      }
                      return null;
                    }
                ),
                SizedBox(
                  height: 10,
                ),
            defaultFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              label: AppStrings.emailHint.tr(),
              prefix: Icons.email,
              validate:(value){
                if(value.isEmpty){
                  return AppStrings.invalidEmail.tr();
                }
                return null;
              }
            ),
                SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                    controller: phoneController,
                    decoration:InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)) ),
                      labelText:AppStrings.phoneNum.tr(),
                    ),

                    validator:(value){
                      if(value!.toString().isEmpty){
                        return AppStrings.errorField.tr();
                      }
                      return null;
                    }
                ),

                SizedBox(height: 10,),
                DropdownButtonFormField(
                    items: [AppStrings.male.tr(), AppStrings.female.tr()].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
                    onChanged: (val){
                      setState(() {
                        selctedGender=val;
                      });
                    },
                  value: selctedGender,
                  hint: Text(AppStrings.gender.tr()),
                  decoration: InputDecoration(
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                defaultButton(function: (){}, text:AppStrings.login.tr(),color:Color(0xff4b4eb0),radius: 35,isUpperCase: true )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
