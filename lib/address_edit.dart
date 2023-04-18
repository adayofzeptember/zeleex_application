import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Delete%20Method/address_delete.dart';
import 'package:zeleex_application/API/Post%20Method/address_update.dart';
import 'API/Read By ID/address_read_for_edit.dart';
import 'Others/Plate.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Address_Edit extends StatefulWidget {
  String? address_id;
  Address_Edit({Key? key, this.address_id}) : super(key: key);

  @override
  State<Address_Edit> createState() => _Address_EditState();
}

enum SingingCharacter { lafayette, jefferson }

String dumbText = '';
String user_name = '';
String user_phone = '';
String user_address = '';
bool status = false;
String user_city = '';
String user_district = '';
String user_province = ''; //! ภูมิภาค
String user_postCode = '';
String userID = '';
String userToken = '';
final formKey_updateAddress = GlobalKey<FormState>();

class _Address_EditState extends State<Address_Edit> {
  int myVar = 1;
  SingingCharacter? _character = SingingCharacter.lafayette;
  late Address_Update_Provider request_add_update;

  //?----------------------- belongs to address shit ------------------------

  Future get_storedToken() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('keyToken');
    var y = prefs2.get('keyID');
    setState(() {
      userID = y.toString();
      userToken = x.toString();
    });
    fetch_address_forEditOnly(widget.address_id.toString(), userToken);
  }

  Future<Data_Address> fetch_address_forEditOnly(
      String address_id, String userToken) async {
    var url = "https://api.zeleex.com/api/address/shipping-edit/" +
        address_id.toString();
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'Authorization': 'Bearer $userToken',
    });

    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data'];
    Data_Address addressDetail = Data_Address.fromJson(jsonCon);

    setState(() {
      user_name = addressDetail.name.toString();
      user_phone = addressDetail.phone.toString();
      user_address = addressDetail.address.toString();
      user_city = addressDetail.city.toString();
      user_district = addressDetail.district.toString();
      user_province = addressDetail.province.toString(); //! ภูมิภาค
      user_postCode = addressDetail.postcode.toString();
    });

    print(addressDetail.default1.toString() + '5555555555');
    if (addressDetail.default1 == 1) {
      setState(() {
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
    request_add_update.default5 = addressDetail.default1.toString();

    return addressDetail;
  }

  //?-----------------------------------------------------

  @override
  void initState() {
    get_storedToken();
    print(widget.address_id);
    request_add_update = Address_Update_Provider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Kanit',
            primarySwatch: ZeleexColor.zeleexGreen,
            appBarTheme: AppBarTheme(color: ZeleexColor.zeleexGreen)),
        home: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: ZeleexColor.zeleexGreen,
            ),
            backgroundColor: ZeleexColor.zeleexGreen,
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
                  "แก้ไขที่อยู่",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Form(
              key: formKey_updateAddress,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\tช่องทางการติดต่อ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      request_add_update.name = newValue.toString();
                    },
                    initialValue: user_name,
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
                    onSaved: (newValue) {
                      request_add_update.phone = newValue.toString();
                    },
                    initialValue: user_phone,
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
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\tที่อยู่: บ้านเลขที่ ซอย หมู่ ถนน แขวง/ตำบล",
                    style: TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      request_add_update.address = newValue.toString();
                    },
                    initialValue: user_address,
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
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 51, 51, 51))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      request_add_update.district = newValue.toString();
                    },
                    initialValue: user_district,
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
                    onSaved: (newValue) {
                      request_add_update.province = newValue.toString();
                      request_add_update.city = newValue.toString();
                    },
                    initialValue: user_province,
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
                    onSaved: (newValue) {
                      request_add_update.postcode = newValue.toString();
                    },
                    initialValue: user_postCode,
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
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text("เลือกเป็นที่อยู่หลัก"),
                      SizedBox(
                        width: 5,
                      ),
                      FlutterSwitch(
                          height: 28,
                          width: 50,
                          toggleColor: Color.fromRGBO(225, 225, 225, 1),
                          activeColor: ZeleexColor.zeleexGreen,
                          value: status,
                          onToggle: (val) {
                            setState(() {
                              print(val);
                              status = val;
                              if (status == false) {
                                request_add_update.default5 = 0.toString();
                              } else {
                                request_add_update.default5 = 1.toString();
                              }
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formKey_updateAddress.currentState!.validate()) {
                        formKey_updateAddress.currentState?.save();
                        address_update(request_add_update,
                            widget.address_id.toString(), userToken.toString());
                      }
                      print(request_add_update.toJson().toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'บันทึก',
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
                        side: BorderSide(
                            color: Color.fromARGB(255, 255, 119, 119)),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {
                      show_deleteAddress_ConfirmDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "ลบที่อยู่",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 119, 119),
                              fontSize: 15),
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

  show_deleteAddress_ConfirmDialog(
    BuildContext context,
  ) {
    Widget cancelButton = ElevatedButton(
      child: Text(
        "ยกเลิก",
        style: TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget confirmButton = ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(117, 244, 67, 54))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(9, 1, 9, 1),
        child: Text(
          "ลบ",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        address_remove_function(widget.address_id.toString(), userToken);
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: "ลบที่อยู่เรียบร้อยแล้ว",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);

        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title:
          Text("ลบที่อยู่", style: TextStyle(color: Colors.red, fontSize: 20)),
      content: Text(
        "ต้องการลบที่อยู่ ?",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
