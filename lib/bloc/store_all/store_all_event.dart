part of 'store_all_bloc.dart';

abstract class StoreAllEvent extends Equatable {
  const StoreAllEvent();

  @override
  List<Object> get props => [];
}

class Load_AllStores extends StoreAllEvent {}

class Load_StoreInfo extends StoreAllEvent {
  String id;
  var context;

  Load_StoreInfo({required this.id, required this.context});
}
