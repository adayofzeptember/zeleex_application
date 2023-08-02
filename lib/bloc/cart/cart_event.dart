// ignore_for_file: camel_case_types, must_be_immutable

part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class Load_Cart_Store extends CartEvent {}

class Load_Cart_Store_SKU extends CartEvent {
  int getStoreIndex;
  Load_Cart_Store_SKU({required this.getStoreIndex});
}
 