part of 'address_management_bloc.dart';

class AddressManagementState extends Equatable {
  bool address_switch;
  bool loading;
  int ifDeafult;
  dynamic edit_address_data;
  List address_data;
  AddressManagementState(
      {required this.address_switch,
      required this.ifDeafult,
      required this.loading,
      required this.edit_address_data,
      required this.address_data});

  AddressManagementState copyWith(
      {bool? address_switch,
      int? ifDeafult,
      bool? loading,
      List? address_data,
      dynamic? edit_address_data}) {
    return AddressManagementState(
        edit_address_data: edit_address_data ?? edit_address_data,
        ifDeafult: ifDeafult ?? this.ifDeafult,
        address_data: address_data ?? this.address_data,
        loading: loading ?? this.loading,
        address_switch: address_switch ?? this.address_switch);
  }

  @override
  List<Object> get props =>
      [address_switch, ifDeafult, address_data, edit_address_data, loading];
}
