part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class Load_Address extends ProfileEvent {}

class Load_Profile extends ProfileEvent {
  // Load_Profile({

  // });
}
