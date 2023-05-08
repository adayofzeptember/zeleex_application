part of 'main_page_collection_bloc.dart';

class MainPageCollectionState extends Equatable {
  List slider_pics;
  List collection_board;
  List animals_catalog;
  List products_catalog;

  MainPageCollectionState(
      {required this.slider_pics,
      required this.products_catalog,
      required this.collection_board,
      required this.animals_catalog});

  MainPageCollectionState copyWith(
      {List? slider_pics,
      List? animals_catalog,
      List? collection_board,
      List? products_catalog}) {
    return MainPageCollectionState(
        products_catalog: products_catalog ?? this.products_catalog,
        animals_catalog: animals_catalog ?? this.animals_catalog,
        collection_board: collection_board ?? this.collection_board,
        slider_pics: slider_pics ?? this.slider_pics);
  }

  @override
  List<Object> get props => [slider_pics, collection_board, animals_catalog, products_catalog];
}
