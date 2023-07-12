import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/app_pref.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import '../../app/Graphql/app_mutation.dart';
import '../../shared/components/component.dart';
import '../Main/home/home_screen.dart';
import '../Main/main_view.dart';
import '../forget_password/forget_pass.dart';
import '../resources/assets_manager.dart';
import '../resources/styles_manager.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  String email = "";
  String password = "";
  String token = "";
  TokenCache tokenCache =TokenCache();

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
          title: Text(
            AppStrings.login.tr(),
            textAlign: TextAlign.start,
            style: getBoldStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsetsDirectional.only(top: 40, start: 10, end: 10),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
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
                        }),
                    SizedBox(
                      height: 25,
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPass()));
                          },
                          child: Text(
                            AppStrings.forgetPassword.tr(),
                            style: getRegularStyle(
                                color: Color(0xff4b4eb0), fontSize: 13),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkBoxValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkBoxValue = newValue!;
                                });
                              },
                              shape: CircleBorder(
                                  side: BorderSide(style: BorderStyle.solid)),
                            ),
                            Text(
                              AppStrings.rememberMe.tr(),
                              style:
                              getBoldStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Mutation(
                            options: MutationOptions(
                                document: gql(AppMutations.emailAndPasswordLogin),
                                update: (GraphQLDataProxy cache, QueryResult) {
                                  return cache;
                                },
                                onCompleted: (dynamic token) async{
                                  await tokenCache.loadToken();
                                  await tokenCache.token;
                                  if(token!=null){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainView()));
                                }
                                  else{
                                    print("email or password not true");
                                  }
                                }),
                            builder:
                                (RunMutation? runMutation, QueryResult? result)  {
                              if (result!.isLoading) {
                                return Text(AppStrings.loading.tr());
                              }
                              if (result.hasException) {
                                print(result.exception);
                              }
                              if(result.isLoading == false && result.data != null ){
                                token = result.data!['emailAndPasswordLogin']['data']['token'];
                                tokenCache.setToken(token);
                                final t =  tokenCache.token;
                                print(t);
                              }
                              return defaultButton(
                                function: ()  {
                                  if (formKey.currentState!.validate() == true) {
                                    runMutation!({
                                      "input": {
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                      }
                                    });

                                  }
                                },
                                text: AppStrings.login.tr().toUpperCase(),
                                color: Color(0xff4b4eb0),
                              );
                            })),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                              thickness: 4,
                              color: Color(0xffEEEFFF),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 7),
                          child: Text(
                            AppStrings.or.tr(),
                            style: getRegularStyle(
                                color: Color(0xff6F6F6F), fontSize: 20),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                              thickness: 4,
                              color: Color(0xffEEEFFF),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                          image: AssetImage(ImageAssets.googleIcon),
                          height: 29,
                          width: 29,
                        ),
                        Image(
                          image: AssetImage(ImageAssets.facebookIcon),
                          height: 29,
                          width: 29,
                        ),
                        Image(
                          image: AssetImage(ImageAssets.appleIcon),
                          height: 29,
                          width: 29,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
        ));
  }
}