// ignore_for_file: must_be_immutable

part of 'products_bloc.dart';

class ProductsState extends Equatable {
  List product_list;
  int page;
  dynamic product_info;
  List product_skus;
  bool isLoading;
  int dataTotal;

  String show_price;

  ProductsState(
      {required this.product_list,
      required this.page,
      required this.show_price,
      required this.product_skus,
      required this.product_info,
      required this.dataTotal,
      required this.isLoading});

  ProductsState copyWith({
    List? product_list,
    List? product_skus,
    String? show_price,
    int? page,
    dynamic product_info,
    bool? isLoading,
    int? dataTotal,
  }) {
    return ProductsState(
        show_price: show_price ?? this.show_price,
        product_skus: product_skus ?? this.product_skus,
        product_info: product_info ?? this.product_info,
        product_list: product_list ?? this.product_list,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading,
        dataTotal: dataTotal ?? this.dataTotal);
  }

  @override
  List<Object> get props => [
        product_list,
        page,
        isLoading,
        dataTotal,
        product_info,
        product_skus,
        show_price
      ];
}
