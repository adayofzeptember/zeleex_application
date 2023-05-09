part of 'main_page_collection_bloc.dart';

abstract class MainPageCollectionEvent extends Equatable {
  const MainPageCollectionEvent();

  @override
  List<Object> get props => [];
}

class Load_Catalog extends MainPageCollectionEvent {}

class Load_SliderPics extends MainPageCollectionEvent {}

class Get_SearchKeyWords extends MainPageCollectionEvent {}

class Load_ColectionBoard extends MainPageCollectionEvent {}

class IndexSlider extends MainPageCollectionEvent {
  int index;

  IndexSlider({required this.index});
}
