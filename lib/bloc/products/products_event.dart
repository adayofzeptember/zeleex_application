part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}
class Load_AllProdutcs extends ProductsEvent {}


class Load_ProductInfo extends ProductsEvent {
  String id;
  String title;
  var context;

  Load_ProductInfo(
      {required this.id, required this.context, required this.title});
}
