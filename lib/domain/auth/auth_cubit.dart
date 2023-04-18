import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pick_park/shared/components/constants.dart';

import '../../../app/app_pref.dart';
import 'auth_state.dart';
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() :super (AuthInitialState());

  void Register(
      {required String name, required String birth, required String email, required String password, required String phone, required selctedGender }) async {
    emit(RegisterLoadingState());
    Response response = await http.post(
        Uri.parse(Api),
        body: {
          'name': name,
          'email': email,
          'birth': birth,
          'password': password,
          'gender': selctedGender,
          'phone': phone,
        }

    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint("Response is : $data");
        emit(RegisterSuccessState());
      }
      else {
        debugPrint("Response is : $data");
        emit(RegisterFailedState(message: data['message']));
      }
    }
  }
  cache(e){
  debugPrint("Failed to Register , reason : $e");
  emit(RegisterFailedState(message: e.toString()));
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