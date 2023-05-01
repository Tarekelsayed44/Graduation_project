import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/phone_number.dart';
import 'package:pick_park/shared/components/constants.dart';

import '../../../app/app_pref.dart';
import 'auth_state.dart';
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() :super (AuthInitialState());

  void Register(
      {required String name, required String email,
         required String birth,
         required String password,
        required String phone,
       required String  selctedGender,
        required String country,
          String? image
      } )async {
    emit(RegisterLoadingState());
    try{
      Response response = await http.post(
          Uri.parse(Api),
          body: {
            'name': name,
            'email': email,
            'gender': selctedGender,
             'password': password,
            'avatar': image,
             'phone': phone,
             'birth': birth,
            'country': country
          }
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          print(data);
          emit(RegisterSuccessState());
        }
        else {
          print(data);
          emit(RegisterFailedState(message: data['message']));
        }
      }
    }
    catch(e) {
      print("Failed to Register , reason : $e");
      emit(RegisterFailedState(message: e.toString()));
    }
  }
  void login({required String email , required String password}) async {
    emit(loginLoadingState());
    try {
      Response response = await http.post(
          Uri.parse(Api),
          body: {
            'email': email,
            'password': password
          }
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          await CasheNetwork.insertToCache(key: 'token', value: responseData['data']['token']);
          emit(loginSuccessState());
        }
        else {
          emit(loginFailedState(message: responseData['message']));
        }
      }
    }
    catch(e){
      emit(loginFailedState(message: e.toString()));
    }
  }
}
//image
// class Service{
//   Future<int> submitSubscription({File ?file,String ?filename,String ?token})async{
//     ///MultiPart request
//     var request = http.MultipartRequest(
//       'POST', Uri.parse(Api+'upload'),
//
//     );
//     Map<String,String> headers={
//       "Authorization":"Bearer $token",
//       "Content-type": "multipart/form-data"
//     };
//     request.files.add(
//       http.MultipartFile(
//         'file',
//         file!.readAsBytes().asStream(),
//         file!.lengthSync(),
//         filename: filename,
//       ),
//     );
//     request.headers.addAll(headers);
//     request.fields.addAll({
//       "name":"test",
//       "email":"test@gmail.com",
//       "id":"12345"
//     });
//     print("request: "+request.toString());
//     var res = await request.send();
//     print("This is response:"+res.toString());
//     return res.statusCode;
//   }
//  }