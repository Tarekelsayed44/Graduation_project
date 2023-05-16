part of 'bloc_observer.dart';
abstract class AuthStates{}
class AuthInitialState extends AuthStates{}

class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class RegisterFailedState extends AuthStates{
  String message;
  RegisterFailedState({required this.message});

}

class loginLoadingState extends AuthStates{}
class loginSuccessState extends AuthStates{}
class loginFailedState extends AuthStates{
  String message;
  loginFailedState({required this.message});
}

