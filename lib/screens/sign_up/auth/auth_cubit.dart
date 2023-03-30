import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:pick_park/screens/sign_up/auth/auth_state.dart';
import 'package:http/http.dart' as http;

import '../../../app/app_pref.dart';
class AuthCubit extends Cubit<AuthStates>{
  AuthCubit():super (AuthInitialState());
  void Register({required String name , required String calender,required String email , required String phone }) async {
    emit(RegisterLoadingState());
   Response response = await http.post(
       Uri.parse(""),
     body: {

     }

   );
  var responseBody = jsonDecode(response.body);
  if (responseBody['status']==true){
      emit(RegisterSuccessState());
  }
  else{
      emit(RegisterFailedState(message: responseBody['message']));
  }
  }
  void login({required String email , required String password}) async {
    emit(loginLoadingState());
    try {
      Response response = await http.post(
          Uri.parse(""),
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