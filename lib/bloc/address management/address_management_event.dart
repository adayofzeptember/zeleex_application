// ignore_for_file: must_be_immutable

part of 'address_management_bloc.dart';

abstract class AddressManagementEvent extends Equatable {
  const AddressManagementEvent();

  @override
  List<Object> get props => [];
}

class Load_Address extends AddressManagementEvent {}

class EditLoad_Address extends AddressManagementEvent {
  String edit_addressID;
  var context;

  EditLoad_Address({required this.edit_addressID, required this.context});
}

class DeleteAddress extends AddressManagementEvent {
  String addressID;

  DeleteAddress({required this.addressID});
}

class TapSwitchAddress extends AddressManagementEvent {
  bool getBooleanSwitch;

  TapSwitchAddress({required this.getBooleanSwitch});
}

class CheckboxChangeMainAddress extends AddressManagementEvent {
  bool getCheck;

  CheckboxChangeMainAddress({required this.getCheck});
}

class AddNew_Address extends AddressManagementEvent {
  NewAddress_Request address_request;
  var context;

  AddNew_Address({required this.address_request, required this.context});
}

class Update_Address extends AddressManagementEvent {
  NewAddress_Request address_request;
  var context;
  String getID;

  Update_Address(
      {required this.address_request,
      required this.getID,
      required this.context});
}
