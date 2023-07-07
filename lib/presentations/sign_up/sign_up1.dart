import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/send_email/send_email.dart';
import 'package:pick_park/shared/components/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/Graphql/app_mutation.dart';
import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import '../Main/home/home_screen.dart';
import '../forget_password/forget_pass.dart';
import '../login_screen/login_screen.dart';
import '../reset_password/verification_otp.dart';
import '../resources/route_manager.dart';
import 'verified_email/email_verification.dart';

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
  var gender = '';
  String name = "";
  String email = "";
  String password = "";
  String mygender = "";
  String myphone = "";
  String country = "";
  final ImagePicker _picker = ImagePicker();
  PhoneNumber? phone;
  String fullPhone = '';
  String countryCode = '';
  /*------------------------------------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          elevation: 0,
          title: Text(
            AppStrings.fillForm.tr(),
            style: getBoldStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey,
                      backgroundImage: _imageFile == null
                          ? null
                          : FileImage(File(_imageFile!.path)),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: defaultFormField(
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
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                          controller: _date,
                          decoration: InputDecoration(
                            label: Text(AppStrings.birthDate.tr()),
                            prefixIcon: Icon(
                              Icons.calendar_month,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.errorField.tr();
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1800),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              setState(() {
                                _date.text =
                                    DateFormat('yyy-MM-dd').format(pickedDate);
                              });
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: AppStrings.emailHint.tr(),
                          prefix: Icons.email,
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppStrings.invalidEmail.tr();
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: defaultFormField(
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
                        isPassword: true,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 15, bottom: 5),
                      child: IntlPhoneField(
                          controller: phoneController,
                          initialCountryCode: 'EG',
                          onChanged: (phone) {
                            fullPhone = phone.completeNumber;
                            countryCode = phone.countryISOCode;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: AppStrings.phoneNum.tr(),
                          ),
                          validator: (value) {
                            if (value!.toString().isEmpty) {
                              return AppStrings.errorField.tr();
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: DropdownButtonFormField(
                        items: [AppStrings.male.tr(), AppStrings.female.tr()]
                            .map((e) => DropdownMenuItem(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          if(val == 'ذكر'){
                            val = 'MALE';
                          }
                          if(val =='أنثي'){
                            val = 'FEMALE';
                          }
                          setState(() {
                            selctedGender = selctedGender;
                            gender =  val.toString();
                          });
                        },
                        value: selctedGender,
                        hint: Text(AppStrings.gender.tr()),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    Mutation(
                        options: MutationOptions(
                            document: gql(AppMutations.registerAsUser),
                            onCompleted: (dynamic resultData) {
                              _navigateToNextPage(context);
                            }),
                        builder:
                            (RunMutation? runMutation, QueryResult? result) {
                          if (result!.isLoading) {
                            return Text(AppStrings.loading.tr());
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: defaultButton(
                                function: ()  {
                                  runMutation!(
                                    {
                                      'input': {
                                        'name': nameController.text,
                                        'email': emailController.text,
                                        'gender': gender,
                                        'password': passwordController.text,
                                        'phone': fullPhone,
                                        'country': countryCode,
                                      }
                                    },
                                  );

                                },
                                text: AppStrings.containue.tr(),
                                color: Color(0xff4b4eb0),
                                radius: 35,
                                isUpperCase: true),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
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
            FloatingActionButton(
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              child: Icon(Icons.camera_alt),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              child: Icon(Icons.photo),
            )
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
  void _navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>EmailVerification (data: emailController.text),
      ),
    );
  }
}
