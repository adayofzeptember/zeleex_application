// ignore_for_file: must_be_immutable, camel_case_types

part of 'store_indiv_products_animals_bloc.dart';

abstract class StoreIndivProductsAnimalsEvent extends Equatable {
  const StoreIndivProductsAnimalsEvent();

  @override
  List<Object> get props => [];
}

class Load_ProductsInStore extends StoreIndivProductsAnimalsEvent {
  String getStoreID;
  Load_ProductsInStore({required this.getStoreID});
}

class ClearList extends StoreIndivProductsAnimalsEvent {}

class ChangePrdANDAnm extends StoreIndivProductsAnimalsEvent {
  String getString;
  ChangePrdANDAnm({required this.getString});
}

class Load_AnimalsInStore extends StoreIndivProductsAnimalsEvent {
  String getStoreID;
  Load_AnimalsInStore({required this.getStoreID});
}
