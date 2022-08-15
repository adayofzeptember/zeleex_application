import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'Plate.dart';

import 'address_edit.dart';
import 'payment.dart';

class Payment_Address extends StatefulWidget {
  Payment_Address({Key? key}) : super(key: key);

  @override
  State<Payment_Address> createState() => _Payment_AddressState();
}

class _Payment_AddressState extends State<Payment_Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
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
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DottedBorder(
                  color: Palette.kToDark,
                  dashPattern: [8, 4],
                  strokeWidth: 2,
                  child: InkWell(
                    onTap: () {},
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


              
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressEdit_widget(),
                      ));
                },
                child: Container(
                    decoration:
                        // Border.all(color: Palette.kToDark)
                        BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color:
                                        Color.fromARGB(255, 206, 206, 206)))),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset('assets/images/pin.svg'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "ชื่อ นามสกุล ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 51, 51, 51),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "(ค่าเริ่มต้น)",
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
                                      color:
                                          Color.fromARGB(255, 130, 130, 130)))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Container(
                                width: 250,
                                child: Text("081 545 5755",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 130, 130, 130))),
                              )),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Container(
                                width: 250,
                                child: Text(
                                  "369/11 เดชอุดม ซอย 6 ตำบลในเมือง อำเภอเมือง จังหวัดนครราชสีมา 30000",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 130, 130, 130)),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
