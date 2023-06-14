import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../app/Graphql/app_mutation.dart';
import '../../presentations/resources/string_manager.dart';
import '../../presentations/resources/styles_manager.dart';
import '../../shared/components/component.dart';
import '../Main/main_view.dart';

class verificationOtp extends StatefulWidget {
  const verificationOtp({Key? key}) : super(key: key);

  @override
  State<verificationOtp> createState() => _verificationOtpState();
}

class _verificationOtpState extends State<verificationOtp> {
  var _code1 = TextEditingController();
  var _code2 = TextEditingController();
  var _code3 = TextEditingController();
  var _code4 = TextEditingController();
  var emailController = TextEditingController();

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
          backgroundColor: Colors.white,
          titleSpacing: 20,
          title: Text(
            AppStrings.emailVerification.tr(),
            style: getBoldStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 90),
            child: Column(children: [
              Text(
                AppStrings.codeSent.tr(),
                style: getRegularStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                AppStrings.emailEx.tr(),
                style: getSemiBoldStyle(color: Colors.black, fontSize: 19),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 67,
                    height: 61,
                    child: TextFormField(
                        controller: _code1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }),
                  ),
                  SizedBox(
                    width: 67,
                    height: 61,
                    child: TextFormField(
                        controller: _code2,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }),
                  ),
                  SizedBox(
                    width: 67,
                    height: 61,
                    child: TextFormField(
                        controller: _code3,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }),
                  ),
                  SizedBox(
                    width: 67,
                    height: 61,
                    child: TextFormField(
                        controller: _code4,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Mutation(
                    options: MutationOptions(
                        document: gql(AppMutations.verifyUserByEmail),
                        onCompleted: (dynamic resultData) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainView()));
                        }),
                    builder: (RunMutation? runMutation, QueryResult? result) {
                      if (result!.isLoading) {
                        return Text(AppStrings.loading.tr());
                      }

                      if (result.hasException) {
                        print(result.exception);
                      } else {
                        print(result);
                      }
                      return defaultButton(
                          function: () {
                            runMutation!({
                              "input": {
                                'code': _code1.text +
                                    _code2.text +
                                    _code3.text +
                                    _code4.text,
                                'email': emailController.text
                              },
                            });
                          },
                          text: AppStrings.containue.tr(),
                          isUpperCase: true,
                          color: Color(0xff4B4EB0),
                          fontWeight: FontWeight.w700,
                          fontSize: 18);
                    }),
              )
            ])));
  }
}
