part of 'animals_bloc.dart';

abstract class AnimalsEvent extends Equatable {
  const AnimalsEvent();

  @override
  List<Object> get props => [];
}

class Load_AllAnimals extends AnimalsEvent {}

class Load_AnimalInfo extends AnimalsEvent {
  String id;
  String title;
  var context;

  Load_AnimalInfo(
      {required this.id, required this.context, required this.title});
}
