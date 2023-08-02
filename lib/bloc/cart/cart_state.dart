// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

class CartState extends Equatable {
  List cart_list;
  List cart_list_sku;
  bool isLoading;

  CartState({
    required this.cart_list_sku,
    required this.cart_list,
    required this.isLoading,
  });

  CartState copyWith({
    List? cart_list,
        List? cart_list_sku,
    bool? isLoading,
  }) {
    return CartState(
        cart_list_sku: cart_list_sku ?? this.cart_list_sku,
      cart_list: cart_list ?? this.cart_list,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [cart_list, isLoading, cart_list_sku];
}
