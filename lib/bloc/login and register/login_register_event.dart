// ignore_for_file: must_be_immutable

part of 'login_register_bloc.dart';

abstract class LoginRegisterEvent extends Equatable {
  LoginRegisterEvent();

  @override
  List<Object> get props => [];
}

class Register_Casual extends LoginRegisterEvent {
  var context;
  String getRegisterName,
      getRegisterSurename,
      getRegisterEmail,
      getRegisterPassword1,
      getRegisterPassword2;
  bool getRegisterPolicy;

  Register_Casual({
    required this.context,
    required this.getRegisterName,
    required this.getRegisterEmail,
    required this.getRegisterPassword1,
    required this.getRegisterPassword2,
    required this.getRegisterSurename,
    required this.getRegisterPolicy,
  });
}

class Login_Casual extends LoginRegisterEvent {
  var context;
  String getEmail, getPassword;

  Login_Casual(
      {required this.getEmail,
      required this.getPassword,
      required this.context});
}
