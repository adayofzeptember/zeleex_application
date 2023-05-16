part of 'address_management_bloc.dart';

class AddressManagementState extends Equatable {
  bool address_switch;
  int ifDeafult;
  AddressManagementState(
      {required this.address_switch, required this.ifDeafult});

  AddressManagementState copyWith({bool? address_switch, int? ifDeafult}) {
    return AddressManagementState(
        ifDeafult: ifDeafult ?? this.ifDeafult,
        address_switch: address_switch ?? this.address_switch);
  }

  @override
  List<Object> get props => [address_switch, ifDeafult];
}
