// ignore_for_file: must_be_immutable

part of 'store_indiv_products_animals_bloc.dart';

class StoreIndivProductsAnimalsState extends Equatable {
  List products_inStore;
  String count_Check;
  bool loading;
  String checkPrdORAnm;
  StoreIndivProductsAnimalsState(
      {required this.products_inStore,
      required this.count_Check,
      required this.checkPrdORAnm,
      required this.loading});

  StoreIndivProductsAnimalsState copyWith(
      {List? products_inStore,
      String? count_Check,
      bool? loading,
      String? checkPrdORAnm}) {
    return StoreIndivProductsAnimalsState(
      loading: loading ?? this.loading,
      checkPrdORAnm: checkPrdORAnm ?? this.checkPrdORAnm,
      count_Check: count_Check ?? this.count_Check,
      products_inStore: products_inStore ?? this.products_inStore,
    );
  }

  @override
  List<Object> get props =>
      [products_inStore, count_Check, loading, checkPrdORAnm];
}
