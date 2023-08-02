// ignore_for_file: camel_case_types, must_be_immutable

part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class Load_AllProdutcs extends ProductsEvent {}

class Load_SKUS extends ProductsEvent {
  String id;
  Load_SKUS({required this.id});
}

class Show_SKUPrice extends ProductsEvent {
  String thePrice;
  Show_SKUPrice({required this.thePrice});
}

class Clear_Sku extends ProductsEvent {}

class Load_ProductInfo extends ProductsEvent {
  String id;
  String title;
  var context;

  Load_ProductInfo(
      {required this.id, required this.context, required this.title});
}
