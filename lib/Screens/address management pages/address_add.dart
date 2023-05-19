import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/bloc/address%20management/address_management_bloc.dart';

import '../../API/Post Method/address_add_and_edit.dart';
import '../../Others/Plate.dart';
import '../../bloc/address management/model.dart';

class Address_New_Page extends StatefulWidget {
  Address_New_Page({Key? key}) : super(key: key);

  @override
  State<Address_New_Page> createState() => _Address_New_PageState();
}

class _Address_New_PageState extends State<Address_New_Page> {
  
  final _formKeyAddAddress = GlobalKey<FormState>();
  late NewAddress_Request _provider_add_address;
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var provinceController = TextEditingController(); //!ภูมิภาค
  var districtController = TextEditingController();
  var postcodeController = TextEditingController();
  var defaultController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  @override
  void initState() {
    _provider_add_address = NewAddress_Request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            "เพิ่มที่อยู่ใหม่",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          )),
      body: BlocBuilder<AddressManagementBloc, AddressManagementState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Form(
              key: _formKeyAddAddress,
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
                      //  context
                      //   .read<AddressManagementBloc>()
                      //   .add(AddNew_Address(address_request: ));
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรอกชื่อ';
                      }
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
                        hintText: '\t\t\t\tชื่อ - นามสกุล'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: phoneController,
                    onSaved: (input) => _provider_add_address.phone = input,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรอกเบอร์ติดต่อ';
                      }
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
                    onSaved: (input) => _provider_add_address.district = input,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรอกอำเภอ';
                      }
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
                        borderSide: const BorderSide(color: Colors.transparent),
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
                    onSaved: (input) => _provider_add_address.city = input,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรอกจังหวัด';
                      }
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
                        borderSide: const BorderSide(color: Colors.transparent),
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
                    onSaved: (input) => _provider_add_address.postcode = input,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรอกรหัส';
                      }
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
                        borderSide: const BorderSide(color: Colors.transparent),
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
                    onSaved: (input) => _provider_add_address.address = input,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรอกรายละเอียดที่อยู่';
                      }
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
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  // FlutterSwitch(value: status, onToggle: (val) {
                  //   setState(() {
                  //     status = val;
                  //   });
                  // })
                  const SizedBox(
                    height: 10,
                  ),
                  // Text("\tเลขที่อาคาร/ชั้น"),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.transparent),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.transparent),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     filled: true,
                  //     fillColor: Color.fromARGB(255, 243, 238, 238),
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.transparent),
                  //       borderRadius: BorderRadius.circular(20.0),
                  //     ),
                  //     hintText: '',
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     Radio(
                      //       fillColor: MaterialStateColor.resolveWith(
                      //           (states) => ZeleexColor.zeleexGreen),
                      //       value: SingingCharacter.lafayette,
                      //       groupValue: _character,
                      //       onChanged: (SingingCharacter? value) {
                      //         setState(() {
                      //           print(value);
                      //           _character = value;
                      //         });
                      //       },
                      //     ),
                      //     Text(
                      //       'บ้าน',
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Radio(
                      //       fillColor: MaterialStateColor.resolveWith(
                      //           (states) => ZeleexColor.zeleexGreen),
                      //       value: SingingCharacter.jefferson,
                      //       groupValue: _character,
                      //       onChanged: (SingingCharacter? value) {
                      //         setState(() {
                      //           _character = value;
                      //         });
                      //       },
                      //     ),
                      //     Text(
                      //       'ที่ทำงาน',
                      //     ),
                      //   ],
                      // ),

                      const Text(
                        "เลือกเป็นที่อยู่หลัก",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FlutterSwitch(
                          height: 30,
                          width: 50,
                          toggleColor: const Color.fromRGBO(225, 225, 225, 1),
                          activeColor: ZeleexColor.zeleexGreen,
                          value: state.address_switch,
                          onToggle: (val) {
                            context
                                .read<AddressManagementBloc>()
                                .add(TapSwitchAddress(getBooleanSwitch: val));
                            // setState(() {
                            //   status = vaxl;
                            //   print(status);
                            //   if (status.toString() == 'false') {
                            //     print('ไม่หลัก');
                            //     setState(() {
                            //       chooseSwitch = '0';
                            //     });
                            //   } else {
                            //     print('หลัก');
                            //     setState(() {
                            //       chooseSwitch = '1';
                            //     });
                            //   }
                            // });
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        //side: BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKeyAddAddress.currentState!.validate()) {
                        _formKeyAddAddress.currentState?.save();

                        _provider_add_address.defaultt =
                            state.ifDeafult.toString();
                        _provider_add_address.province = 'ประเทศไทย';

                        context.read<AddressManagementBloc>().add(
                            AddNew_Address(
                                address_request: _provider_add_address,
                                context: context));

                        Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "+ เพิ่มที่อยู่",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        side: const BorderSide(color: ZeleexColor.zeleexGreen),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "ยกเลิก",
                          style: TextStyle(
                              color: ZeleexColor.zeleexGreen, fontSize: 15),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
