part of 'products_bloc.dart';

class ProductsState extends Equatable {
  List product_list;
  int page;
  bool isLoading;
  int dataTotal;

  ProductsState(
      {required this.product_list,
      required this.page,
      required this.dataTotal,
      required this.isLoading});

  ProductsState copyWith({
    List? product_list,
    int? page,
    bool? isLoading,
    int? dataTotal,
  }) {
    return ProductsState(
        product_list: product_list ?? this.product_list,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading,
        dataTotal: dataTotal ?? this.dataTotal);
  }

  @override
  List<Object> get props => [product_list, page, isLoading, dataTotal];
}
