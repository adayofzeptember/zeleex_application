part of 'cart_bloc.dart';

class CartState extends Equatable {
  List cart_list;
  bool isLoading;

  CartState({
    required this.cart_list,
    required this.isLoading,
  });

  CartState copyWith({
    List? cart_list,
    bool? isLoading,
  }) {
    return CartState(
      cart_list: cart_list ?? this.cart_list,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [cart_list, isLoading];
}
