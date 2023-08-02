// ignore_for_file: camel_case_types, must_be_immutable

part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class Add_Product_toCart extends AddToCartEvent {
  String getStoreID, getPorductSkuID, getUnit;

  Add_Product_toCart({
    required this.getPorductSkuID,
    required this.getUnit,
    required this.getStoreID,
  });
}
