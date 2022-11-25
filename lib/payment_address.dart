import 'dart:async';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Read%20All/shipping_list.dart';
import 'package:zeleex_application/address_add.dart';
import 'Plate.dart';
import 'address_edit.dart';
import 'payment.dart';

class Payment_Address extends StatefulWidget {


  Payment_Address({Key? key}) : super(key: key);
  @override
  State<Payment_Address> createState() => _Payment_AddressState();
}

String userID = '';
String userToken = '';

class _Payment_AddressState extends State<Payment_Address> {
  late Future<List<Data_Shipping_List>> _fetched_address2;

  bool checkDefault = false;

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
  initState() {
    get_storedToken();
    _fetched_address2 = fetch_shipping_list(userToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.kToDark,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Palette.kToDark,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "เลือกที่อยู่ในการจัดส่ง",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.abc_sharp,
                color: Palette.kToDark,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DottedBorder(
                  color: Palette.kToDark,
                  dashPattern: [8, 4],
                  strokeWidth: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Address_AddNew(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              style: BorderStyle.none, color: Palette.kToDark)),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "+ เพิ่มที่อยู่",
                          style:
                              TextStyle(color: Palette.kToDark, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  strokeCap: StrokeCap.round,
                ),
              ),
              FutureBuilder<List<Data_Shipping_List>>(
                future: fetch_shipping_list(userToken),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data_Shipping_List>? data = snapshot.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var getDf = data[index].default_status;
                          if (getDf == 1) {
                            checkDefault = true;
                          } else {
                            checkDefault = false;
                          }
                          return InkWell(
                            splashColor: Palette.kToDark,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Address_Edit(
                                      address_id: data[index].id.toString(),
                                    ),
                                  ));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 206, 206, 206)))),
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 20, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/pin.svg'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                data[index].name.toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 51, 51, 51),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                checkDefault
                                                    ? '(ค่าเริ่มต้น)'
                                                    : '',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                          Text("แก้ไข >",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 130, 130, 130)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 0, 0),
                                          child: Container(
                                            width: 250,
                                            child: Row(
                                              children: [
                                                Text('เบอร์โทร: '),
                                                Text(
                                                  data[index].phone.toString(),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 0, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[index].address.toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 130, 130, 130)),
                                              ),
                                              Text(
                                                  data[index]
                                                          .district
                                                          .toString() +
                                                      ' ' +
                                                      data[index]
                                                          .province
                                                          .toString() +
                                                      ' ' +
                                                      data[index]
                                                          .city
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 130, 130, 130))),
                                              Text(
                                                  data[index]
                                                      .postcode
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 130, 130, 130))),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                )),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Container();
                  }
                  return Text('กรุณารอสักครู่...');
                },
              ),
            ],
          ),
        ));
  }
}
