import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'API/Post Method/address_add_and_edit.dart';
import 'Plate.dart';

class Address_AddNew extends StatefulWidget {
  Address_AddNew({Key? key}) : super(key: key);

  @override
  State<Address_AddNew> createState() => _Address_AddNewState();
}

enum SingingCharacter { lafayette, jefferson }

String chooseSwitch = '0';
String? userID = "";
String? userToken = "";

final _formKeyAddAddress = GlobalKey<FormState>();
late Provider_AddAddress _provider_add_address;

var addressController = TextEditingController();
var cityController = TextEditingController();
var provinceController = TextEditingController(); //!ภูมิภาค
var districtController = TextEditingController();
var postcodeController = TextEditingController();
var defaultController = TextEditingController();
var phoneController = TextEditingController();
var nameController = TextEditingController();

class _Address_AddNewState extends State<Address_AddNew> {
  bool status = false;
  SingingCharacter? _character = SingingCharacter.lafayette;

  Future get_storedToken() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('keyToken');
    var y = prefs2.get('keyID');
    setState(() {
      userID = y.toString();
      userToken = x.toString();
    });
  }

  @override
  void initState() {
    get_storedToken();
    _provider_add_address = Provider_AddAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Kanit',
            primarySwatch: Palette.kToDark,
            appBarTheme: AppBarTheme(color: Palette.kToDark)),
        home: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: Palette.kToDark,
            ),
            backgroundColor: Palette.kToDark,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "เพิ่มที่อยู่ใหม่",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "  ",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Form(
              key: _formKeyAddAddress,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\tช่องทางการติดต่อ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51), fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    onSaved: (input) => _provider_add_address.name = input,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรอกชื่อ';
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 243, 238, 238),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: '\t\t\t\tชื่อ - นามสกุล',
                    ),
                  ),
                  SizedBox(
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
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 243, 238, 238),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: '\t\t\t\tหมายเลขโทรศัพท์',
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\tที่อยู่",
                    style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51), fontSize: 15),
                  ),
                  SizedBox(
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
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Color.fromARGB(255, 121, 120, 120),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 243, 238, 238),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: '\t\t\t\tอำเภอ',
                    ),
                  ),
                  SizedBox(
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
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Color.fromARGB(255, 121, 120, 120),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 243, 238, 238),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: '\t\t\t\tจังหวัด',
                    ),
                  ),
                  SizedBox(
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
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Color.fromARGB(255, 121, 120, 120),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 243, 238, 238),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: '\t\t\t\tรหัสไปรษณีย์',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("\tที่อยู่: บ้านเลขที่ ซอย หมู่ ถนน แขวง/ตำบล"),
                  SizedBox(
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
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Color.fromARGB(255, 121, 120, 120),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 243, 238, 238),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  // FlutterSwitch(value: status, onToggle: (val) {
                  //   setState(() {
                  //     status = val;
                  //   });
                  // })
                  SizedBox(
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
                  //     labelText: '',
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     Radio(
                      //       fillColor: MaterialStateColor.resolveWith(
                      //           (states) => Palette.kToDark),
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
                      //           (states) => Palette.kToDark),
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

                      Text("เลือกเป็นที่อยู่หลัก"),
                      SizedBox(
                        width: 5,
                      ),
                      FlutterSwitch(
                          height: 30,
                          width: 50,
                          toggleColor: Color.fromRGBO(225, 225, 225, 1),
                          activeColor: Palette.kToDark,
                          value: status,
                          onToggle: (vaxl) {
                            setState(() {
                              status = vaxl;
                              print(status);
                              if (status.toString() == 'false') {
                                print('ไม่หลัก');
                                setState(() {
                                  chooseSwitch = '0';
                                });
                              } else {
                                print('หลัก');
                                setState(() {
                                  chooseSwitch = '1';
                                });
                              }
                            });
                          })
                    ],
                  ),
                  SizedBox(
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
                            chooseSwitch.toString();

                        _provider_add_address.province = 'ประเทศไทย';
                        print(_provider_add_address.toJson().toString());
                        add_new_address(
                            _provider_add_address, userToken.toString());

                        Fluttertoast.showToast(
                            msg: "เพิ่มที่อยู่ใหม่แล้ว",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Color.fromARGB(255, 235, 235, 235),
                            textColor: Palette.kToDark,
                            fontSize: 15);

                        Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "+ เพิ่มที่อยู่",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        side: BorderSide(color: Palette.kToDark),
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
                        child: Text(
                          "ยกเลิก",
                          style:
                              TextStyle(color: Palette.kToDark, fontSize: 15),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
