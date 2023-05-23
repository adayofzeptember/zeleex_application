part of 'check_bloc.dart';

abstract class CheckEvent extends Equatable {
  const CheckEvent();

  @override
  List<Object> get props => [];
}

class CheckboxChangeMainAddressx extends CheckEvent {
  bool getCheck;

  CheckboxChangeMainAddressx({required this.getCheck});
}

class ClearCheck extends CheckEvent {}
