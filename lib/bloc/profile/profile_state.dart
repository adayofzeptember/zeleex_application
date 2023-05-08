part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  dynamic profile_data;
  List address_data;
  bool loading;
  ProfileState(
      {required this.profile_data,
      required this.address_data,
      required this.loading,
    
      
      });

  ProfileState copyWith({
    dynamic? profile_data,
    List? address_data,
    bool? loading,
  }) {
    return ProfileState(
      profile_data: profile_data ?? this.profile_data,
      loading: loading ?? this.loading,
      address_data: address_data ?? this.address_data
    
    );
  }

  @override
  List<Object> get props => [profile_data, loading, address_data];
}
