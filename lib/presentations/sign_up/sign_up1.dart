import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/shared/components/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/auth/auth_cubit.dart';
import '../../domain/auth/auth_state.dart';
import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import '../Main/home/home_screen.dart';

class Register_form extends StatefulWidget {
  const Register_form({Key? key}) : super(key: key);

  @override
  State<Register_form> createState() => _Register_formState();
}

class _Register_formState extends State<Register_form> {
    PickedFile? _imageFile;
  var nameController = TextEditingController();
  var _date = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  var selctedGender;
  final ImagePicker _picker = ImagePicker();
  PhoneNumber? phone;
  //DateTime?_dateTime;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
        listener: (context,State){
          if( State is RegisterLoadingState )
          {
            showAlertDialog(
                context: context,
                backgroundColor: Colors.white,
                content: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                  child: Row(
                    children:
                    [
                      SizedBox(width: 12.5),
                      Text(AppStrings.loading.tr(),style: TextStyle(fontWeight: FontWeight.w500),),
                    ],
                  ),
                )
            );
          }
          else if( State is RegisterFailedState )
          {
            showAlertDialog(
                context: context,
                backgroundColor: Colors.red,
                content: Text(State.message,)
            );
          }
          else if ( State is RegisterSuccessState )
          {
            Navigator.pop(context);   // عشان يخرج من alertDialog
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          }
        },
        builder: (context,State) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back, color: Colors.black),),
              elevation: 0,
              title: Text(AppStrings.fillForm.tr(),
                style: getBoldStyle(color: Colors.black),),
              backgroundColor: Colors.white,
            ),
            body: Container(
              padding: EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey,
                        backgroundImage: _imageFile == null? null
                            :FileImage(File(_imageFile!.path)),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 20.0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()));
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.teal,
                            size: 28.0,
                          ),
                        ),
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: AppStrings.fullName.tr(),
                          prefix: Icons.person,
                          radius: 20,
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppStrings.errorField.tr();
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                        TextFormField(
                          controller: _date,
                           decoration: InputDecoration(
                             label: Text(AppStrings.birthDate.tr()),
                             prefixIcon: Icon(Icons.calendar_month,),
                             border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                           ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.errorField.tr();
                              }
                              return null;
                            },
                            onTap: ()async {
                             DateTime ?pickedDate= await showDatePicker(context: context,
                                  initialDate: DateTime.now(), firstDate: DateTime(1800), lastDate: DateTime(2100));
                              if(pickedDate!=null){
                                setState(() {
                                  _date.text=DateFormat('yyy-MM-dd').format(pickedDate);
                                });

                              }
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
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppStrings.invalidEmail.tr();
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return AppStrings.passwordError.tr();
                          }
                          return null;
                        },
                        onSubmit: () {
                          if (formKey.currentState!.validate()) {
                            return "invalid";
                          }
                        },
                        type: TextInputType.visiblePassword,
                        label: AppStrings.password.tr(),
                        prefix: Icons.lock,
                        suffix: isPassword == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixPressed: () {
                          setState(() {
                            isPassword == true
                                ? Icons.visibility
                                : Icons.visibility_off;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IntlPhoneField(
                          controller:phoneController,
                          initialCountryCode: 'EG',
                        // onChanged: (phone) {
                        //   print(phone.completeNumber);
                        // },
                        // onCountryChanged: (phone) {
                        //   print(phone.code);
                        // },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))),
                            labelText: AppStrings.phoneNum.tr(),
                          ),
                          validator: (value) {
                            if (value!.toString().isEmpty) {
                              return AppStrings.errorField.tr();
                            }
                            return null;
                          }
                      ),

                      SizedBox(height: 10,),
                      DropdownButtonFormField(
                        items: [AppStrings.male.tr(), AppStrings.female.tr()]
                            .map((e) =>
                            DropdownMenuItem(child: Text("$e"), value: e,))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selctedGender = val;
                          });
                        },
                        value: selctedGender,
                        hint: Text(AppStrings.gender.tr()),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultButton(function: () {
                        if(formKey.currentState!.validate()){
                            BlocProvider.of<AuthCubit>(context).Register(name: nameController.text,password: passwordController.text, email: emailController.text, phone:phone!.completeNumber, selctedGender: selctedGender, birth: _date.text, country:phone!.countryISOCode,image: _imageFile!.path);
                        }
                      },
                          text: State is RegisterLoadingState?AppStrings.loading.tr(): AppStrings.containue.tr(),
                          color: Color(0xff4b4eb0),
                          radius: 35,
                          isUpperCase: true)
                    ],
                  ),
                ),
              ),
            ),
          );
        }

    );
  }
   Widget bottomSheet() {
     return Container(
       height: 100.0,
       width: MediaQuery.of(context).size.width,
       margin: EdgeInsets.symmetric(
         horizontal: 20,
         vertical: 20,
       ),
       child: Column(
         children: <Widget>[
           Text(
             "Choose Profile photo",
             style: TextStyle(
               fontSize: 20.0,
             ),
           ),
           SizedBox(
             height: 20,
           ),
           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
             FloatingActionButton(onPressed: (){ takePhoto(ImageSource.camera);},
               child: Icon(Icons.camera_alt),
             ),
            SizedBox( width:  10,),
            FloatingActionButton(onPressed: (){takePhoto(ImageSource.gallery);},child: Icon(Icons.photo),)
           ])
         ],
       ),
     );
   }

   void takePhoto(ImageSource source) async {
     final pickedFile = await _picker.getImage(
       source: source,
     );
     setState(() {
       _imageFile = pickedFile!;
     });
   }
}