// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import '../../../app/Graphql/app_mutation.dart';
// import '../../../shared/components/component.dart';
// import '../resources/string_manager.dart';
// import '../resources/styles_manager.dart';
// import '../sign_up/verified_email/email_verification.dart';
// class SendEmail extends StatefulWidget {
//   const SendEmail({Key? key}) : super(key: key);
//
//   @override
//   State<SendEmail> createState() => _SendEmailState();
// }
//
// class _SendEmailState extends State<SendEmail> {
//   var _code1 = TextEditingController();
//   var _code2 = TextEditingController();
//   var _code3 = TextEditingController();
//   var _code4 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(
//       leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),
//       elevation: 0,
//       backgroundColor: Colors.white,
//       titleSpacing: 20,
//       title: Row(
//         children: [
//           Spacer(),
//           Text(
//             AppStrings.emailEx.tr(),
//             style: getBoldStyle(
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10.0, right: 10, top: 90),
//         child: Column(
//           children: [
//             Text(
//               AppStrings.codeSent.tr(),
//               style: getRegularStyle(color: Colors.black, fontSize: 18),
//             ),
//             Text(
//               AppStrings.phone.tr(),
//               style: getSemiBoldStyle(color: Colors.black, fontSize: 19),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 50),
//               child: Mutation(
//                   options: MutationOptions(
//                       document: gql(AppMutations.sendEmail),
//                       onCompleted:(dynamic resultData) {
//                         print(resultData);
//                             (_) =>  Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => EmailVerification()));
//                       }),
//                   builder: (
//                       RunMutation? runMutation,
//                       QueryResult? result) {
//                     if (result!.isLoading) {
//                       return Text(AppStrings.loading.tr());
//                     }
//
//                     if (result.hasException) {
//                       print(result.exception);
//                     }
//                     else {
//                       print(result);
//                     }
//                     return defaultButton(
//                         function: () {
//                           runMutation!({
//                             "input": {
//                               'code': _code1.text + _code2.text + _code3.text + _code4.text,
//                             },
//                             "data" : {
//                               'id'
//                                   'name'
//                                   'token'
//                             }
//                           });
//                         },
//                         text: AppStrings.containue.tr(),
//                         isUpperCase: true,
//                         color: Color(0xff4B4EB0),
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18);
//                   }  ),
//             )
//           ],
//         ),
//       ),);
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/presentations/reset_password/verification_otp.dart';

import '../../app/Graphql/app_mutation.dart';
import '../../shared/components/component.dart';
import '../reset_password/resetPassword.dart';
import '../resources/string_manager.dart';
import '../resources/styles_manager.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({Key? key}) : super(key: key);

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String email = "";

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
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title: Text(
          AppStrings.sendEmail.tr(),
          style: getBoldStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
              Spacer(),
              Mutation(
                  options: MutationOptions(
                      document: gql(AppMutations.sendCode),
                      onCompleted: (dynamic resultData) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => verificationOtp()));
                      }
                      ),
                  builder: (RunMutation? runMutation, QueryResult? result) {
                    if (result!.isLoading) {
                      return Text(AppStrings.loading.tr());
                    }
                    if (result.hasException) {
                      print(result);
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
                      child: defaultButton(
                          function: () {
                            runMutation!({
                              "input": {
                                'email': emailController.text,
                                'useCase': 'EMAIL_VERIFICATION'
                              },
                            });
                          },
                          text: AppStrings.send.tr(),
                          color: Color(0xff4b4eb0),
                          radius: 35,
                          isUpperCase: true),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
