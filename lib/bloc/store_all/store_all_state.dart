part of 'store_all_bloc.dart';

class StoreAllState extends Equatable {
  List allstores_data;
  dynamic store_info;
  int page;
  bool isLoading;
  int dataTotal;

  StoreAllState(
      {required this.allstores_data,
      required this.page,
      required this.store_info,
      required this.isLoading,
      required this.dataTotal});

  StoreAllState copyWith({
    List? allstores_data,
    int? page,
    bool? isLoading,
    dynamic store_info,
    int? dataTotal,
  }) {
    return StoreAllState(
        allstores_data: allstores_data ?? this.allstores_data,
        page: page ?? this.page,
        store_info: store_info ?? this.store_info,
        isLoading: isLoading ?? this.isLoading,
        dataTotal: dataTotal ?? this.dataTotal);
  }

  @override
  List<Object> get props => [allstores_data, page, isLoading, dataTotal, store_info];
}
