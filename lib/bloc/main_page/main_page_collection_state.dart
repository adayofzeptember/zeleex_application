part of 'main_page_collection_bloc.dart';

class MainPageCollectionState extends Equatable {
  List slider_pics;
  List collection_board;
  List animals_catalog;
  List products_catalog;
  List search_keyWords;
  int slider_index;

  MainPageCollectionState(
      {required this.slider_pics,
      required this.search_keyWords,
      required this.slider_index,
      required this.products_catalog,
      required this.collection_board,
      required this.animals_catalog});

  MainPageCollectionState copyWith(
      {List? slider_pics,
      List? animals_catalog,
      List? collection_board,
      int? slider_index,
      List? search_keyWords,
      List? products_catalog}) {
    return MainPageCollectionState(
        slider_index: slider_index ?? this.slider_index,
        products_catalog: products_catalog ?? this.products_catalog,
        search_keyWords: search_keyWords ?? this.search_keyWords,
        animals_catalog: animals_catalog ?? this.animals_catalog,
        collection_board: collection_board ?? this.collection_board,
        slider_pics: slider_pics ?? this.slider_pics);
  }

  @override
  List<Object> get props => [
        slider_index,
        slider_pics,
        collection_board,
        animals_catalog,
        search_keyWords,
        products_catalog
      ];
}
