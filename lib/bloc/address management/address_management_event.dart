part of 'address_management_bloc.dart';

abstract class AddressManagementEvent extends Equatable {
  const AddressManagementEvent();

  @override
  List<Object> get props => [];
}

class Load_Address extends AddressManagementEvent {}
class Load_Address2 extends AddressManagementEvent {}

class EditLoad_Address extends AddressManagementEvent {
  String edit_addressID;
  EditLoad_Address({required this.edit_addressID});
}

class DeleteAddress extends AddressManagementEvent {
  String addressID;

  DeleteAddress({required this.addressID});
}

class TapSwitchAddress extends AddressManagementEvent {
  bool getBooleanSwitch;

  TapSwitchAddress({required this.getBooleanSwitch});
}

class AddNew_Address extends AddressManagementEvent {
  NewAddress_Request address_request;
  var context;

  AddNew_Address({required this.address_request, required this.context});
}
