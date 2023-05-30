// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables

part of 'store_all_bloc.dart';

abstract class StoreAllEvent extends Equatable {
  const StoreAllEvent();

  @override
  List<Object> get props => [];
}

class Load_AllStores extends StoreAllEvent {}

class PressBotton extends StoreAllEvent {
  int getIntBotton;

  PressBotton({required this.getIntBotton});
}

class Load_StoreInfo extends StoreAllEvent {
  String id;
  String title;
  var context;

  Load_StoreInfo(
      {required this.id, required this.context, required this.title});
}
