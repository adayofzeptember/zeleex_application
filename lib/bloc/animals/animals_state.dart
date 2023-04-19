part of 'animals_bloc.dart';

class AnimalsState extends Equatable {
  List animals_data;
  dynamic animal_info;
  int page;
  bool isLoading;
  int dataTotal;

  AnimalsState(
      {required this.animals_data,
      required this.animal_info,
      required this.page,
      required this.dataTotal,
      required this.isLoading});

  AnimalsState copyWith({
    List? animals_data,
    dynamic animal_info,
    int? page,
    bool? isLoading,
    int? dataTotal,
  }) {
    return AnimalsState(
        animals_data: animals_data ?? this.animals_data,
        animal_info: animal_info ?? this.animal_info,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading,
        dataTotal: dataTotal ?? this.dataTotal);
  }

  @override
  List<Object> get props => [animals_data, animal_info, isLoading , page, dataTotal];
}
