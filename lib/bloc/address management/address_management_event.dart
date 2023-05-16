part of 'address_management_bloc.dart';

abstract class AddressManagementEvent extends Equatable {
  const AddressManagementEvent();

  @override
  List<Object> get props => [];
}

class TapSwitchAddress extends AddressManagementEvent {
  bool getBooleanSwitch;

  TapSwitchAddress({required this.getBooleanSwitch});
}

class AddNew_Address extends AddressManagementEvent {
  NewAddress_Request address_request;

  AddNew_Address({required this.address_request});
}
