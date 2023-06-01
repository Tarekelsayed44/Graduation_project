import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/presentations/login_screen/login_screen.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../app/Graphql/app_mutation.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool checkBoxValue = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          AppStrings.resetPassword.tr(),
          style: getBoldStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image(
                  image: AssetImage(ImageAssets.resetpass),
                  width: size.width-size.width/5,
                  height: size.height/4,
                )),
                SizedBox(
                  height: 25,
                ),
                Text(
                  AppStrings.resetPassword2.tr(),
                  style: getBoldStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 25,
                ),
                defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: AppStrings.emailHint.tr(),
                  prefix: Icons.email,
                ),
                SizedBox(
                  height: 25,
                ),
                defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: AppStrings.password.tr(),
                    prefix: Icons.lock,
                    isPassword: true,
                    suffixPressed: () {
                      Icons.remove_red_eye;
                      setState(() {
                        isPassword = !isPassword;
                      });
                      Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off);
                    }),
                Row(
                  children: [
                    Checkbox(
                      value: checkBoxValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkBoxValue = newValue!;
                        });
                      },
                      // checkColor: Color(0xff4b4eb0),
                      shape: CircleBorder(
                          side: BorderSide(style: BorderStyle.solid)),
                    ),
                    Text(
                      AppStrings.rememberMe.tr(),
                      style: getMediumStyle(color: Colors.black,fontSize: 16),
                    ),
                  ],
                ),
                Mutation(
                    options: MutationOptions(
                        document: gql(AppMutations.resetPasswordByEmail),
                        update: (GraphQLDataProxy cache, QueryResult) {
                          return cache;
                        },
                        onCompleted: (dynamic resultData) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginScreen()));
                        }),
                    builder: (RunMutation? runMutation, QueryResult? result) {
                      if (result!.isLoading) {
                        return Text(AppStrings.loading.tr());
                      }
                      if (result.hasException) {
                        print(result.exception);
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                        child: Center(
                          child: defaultButton(
                            function: () {
                              runMutation!({
                                "resetPasswordByEmail": {
                                  "input": {
                                    'email': emailController.text,
                                    'newPassword': passwordController.text,
                                  },
                                  "data": {
                                    "id"
                                        "token"
                                  }
                                }
                              });
                            },
                            text: AppStrings.containue.tr(),
                            color: Color(0xff4b4eb0),
                            textColor: Colors.white,
                            radius: 35,
                            isUpperCase: true,
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),

    );
  }
}
