// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names, prefer_final_fields, must_be_immutable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:zeleex_application/bloc/address%20management/address_management_bloc.dart';
import 'package:zeleex_application/bloc/check%20box/check_bloc.dart';
import '../../Others/Plate.dart';
import '../../bloc/address management/model.dart';

class Address_Edit_Page extends StatelessWidget {
  Address_Edit_Page({Key? key}) : super(key: key);

  final _formKeyEditAddress = GlobalKey<FormState>();

  late NewAddress_Request _provider_add_address = NewAddress_Request();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressManagementBloc, AddressManagementState>(
        builder: (context, state) {
      if (state.loading == true) {
        return Scaffold(
            body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: JumpingText(
                'กำลังโหลด...',
                style: const TextStyle(
                    fontSize: 25,
                    color: ZeleexColor.zeleexGreen,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
      } else {
        var addressController =
            TextEditingController(text: state.edit_address_data.address);
        var cityController =
            TextEditingController(text: state.edit_address_data.city);
        var districtController =
            TextEditingController(text: state.edit_address_data.district);
        var postcodeController =
            TextEditingController(text: state.edit_address_data.postcode);
        // var defaultController = TextEditingController(text: state.edit_address_data.defaultController);
        var phoneController =
            TextEditingController(text: state.edit_address_data.phone);
        var nameController =
            TextEditingController(text: state.edit_address_data.name);
        return Scaffold(
            appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  // Status bar color
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                  statusBarColor: ZeleexColor.zeleexGreen,
                ),
                backgroundColor: ZeleexColor.zeleexGreen,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "แก้ไขที่อยู่",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                  onPressed: () async {
                    context.read<CheckBloc>().add(ClearCheck());
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                )),
            body: BlocBuilder<CheckBloc, CheckState>(
              builder: (context, stateCheck) {
                return SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Form(
                    key: _formKeyEditAddress,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "\tช่องทางการติดต่อ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          onSaved: (input) {
                            _provider_add_address.name = input;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรอกชื่อ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: '\t\t\t\tชื่อ - นามสกุล'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: phoneController,
                          onSaved: (input) =>
                              _provider_add_address.phone = input,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรอกเบอร์ติดต่อ';
                            }
                            return null;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 243, 238, 238),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: '\t\t\t\tหมายเลขโทรศัพท์',
                              labelStyle: const TextStyle(fontSize: 15)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "\tที่อยู่",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: districtController,
                          onSaved: (input) =>
                              _provider_add_address.district = input,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรอกอำเภอ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 238, 238),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: '\t\t\t\tอำเภอ',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: cityController,
                          onSaved: (input) =>
                              _provider_add_address.city = input,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรอกจังหวัด';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // suffixIcon: Icon(
                            //   Icons.arrow_drop_down_sharp,
                            //   color: Color.fromARGB(255, 121, 120, 120),
                            // ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 238, 238),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: '\t\t\t\tจังหวัด',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: postcodeController,
                          onSaved: (input) =>
                              _provider_add_address.postcode = input,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรอกรหัส';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // suffixIcon: Icon(
                            //   Icons.arrow_drop_down_sharp,
                            //   color: Color.fromARGB(255, 121, 120, 120),
                            // ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 238, 238),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: '\t\t\t\tรหัสไปรษณีย์',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "\t บ้านเลขที่ ซอย หมู่ ถนน แขวง/ตำบล",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: addressController,
                          onSaved: (input) =>
                              _provider_add_address.address = input,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรอกรายละเอียดที่อยู่';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // suffixIcon: Icon(
                            //   Icons.arrow_drop_down_sharp,
                            //   color: Color.fromARGB(255, 121, 120, 120),
                            // ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 238, 238),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        state.edit_address_data.defaultStatus
                            ? Row(
                                children: [
                                  const Text(
                                    'ที่อยู่หลัก',
                                    style: TextStyle(
                                      color: ZeleexColor.zeleexGreen,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.check,
                                    color: ZeleexColor.zeleexGreen,
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Checkbox(
                                        hoverColor: ZeleexColor.zeleexGreen,
                                        focusColor: ZeleexColor.zeleexGreen,
                                        activeColor: ZeleexColor.zeleexGreen,
                                        checkColor: Colors.white,
                                        value: stateCheck.isCheck,
                                        onChanged: (value) {
                                          context.read<CheckBloc>().add(
                                              CheckboxChangeMainAddressx(
                                                  getCheck: value!));
                                        },
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'เลือกเป็นที่อยู่หลัก',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: ZeleexColor.zeleexGreen,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          onPressed: () {
                            // print(addressController.text);
                            // _provider_add_address.address =
                            //     addressController.text.toString();
                            // print(_provider_add_address.address);

                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_formKeyEditAddress.currentState!.validate()) {
                              _formKeyEditAddress.currentState?.save();
                              //*
                              _provider_add_address.defaultt =
                                  stateCheck.defaultOrNot.toString();
                              print(jsonEncode(_provider_add_address));
                              _provider_add_address.province = 'ประเทศไทย';
                              context.read<AddressManagementBloc>().add(
                                  Update_Address(
                                      getID: state.edit_address_data.id,
                                      address_request: _provider_add_address,
                                      context: context));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "ยืนยัน",
                                style: TextStyle(
                                    color: ZeleexColor.zeleexGreen,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              },
            ));
      }
    });
  }
}
