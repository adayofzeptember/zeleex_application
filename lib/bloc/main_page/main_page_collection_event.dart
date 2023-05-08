part of 'main_page_collection_bloc.dart';

abstract class MainPageCollectionEvent extends Equatable {
  const MainPageCollectionEvent();

  @override
  List<Object> get props => [];
}
class Load_Aimals_Catalog extends MainPageCollectionEvent {}
class Load_SliderPics extends MainPageCollectionEvent {}
class Load_ColeectionBoard extends MainPageCollectionEvent {}
