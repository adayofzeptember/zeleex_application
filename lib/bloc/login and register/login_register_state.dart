// ignore_for_file: must_be_immutable

part of 'login_register_bloc.dart';

class LoginRegisterState extends Equatable {
  bool loading;
  LoginRegisterState({required this.loading});

  LoginRegisterState copyWith({
    bool? loading,
  }) {
    return LoginRegisterState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [loading];
}
