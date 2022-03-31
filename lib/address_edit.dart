import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Plate.dart';

void main(List<String> args) {
  runApp(AddressEdit_widget());
}

class AddressEdit_widget extends StatefulWidget {
  AddressEdit_widget({Key? key}) : super(key: key);

  @override
  State<AddressEdit_widget> createState() => _AddressEdit_widgetState();
}


enum SingingCharacter { lafayette, jefferson }

class _AddressEdit_widgetState extends State<AddressEdit_widget> {
  bool status = false;
  int myVar = 1;
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Kanit',
            primarySwatch: Palette.kToDark,
            appBarTheme: AppBarTheme(color: Palette.kToDark)),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.kToDark,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "แก้ไขที่อยู่",
                  style: TextStyle(color: Colors.white),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\tช่องทางการติดต่อ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 51, 51, 51), fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 243, 238, 238),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: '\t\t\t\tชื่อ-สกุล',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 184, 184, 184))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 243, 238, 238),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: '\t\t\t\t หมายเลขโทรศัพท์',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 184, 184, 184))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "\tที่อยู่",
                  style: TextStyle(
                      color: Color.fromARGB(255, 51, 51, 51), fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
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
                    labelText: '\t\t\t\tนครราชสีมา',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
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
                    labelText: '\t\t\t\tเมืองนครราชสีมา',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
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
                    labelText: '\t\t\t\t30000',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("\tที่อยู่: บ้านเลขที่ วอย หมู่ ถนน แขวง/ตำบล"),
                SizedBox(
                  height: 5,
                ),
                TextField(
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
                      labelText: '\t\t\t\t369/11 ซ. เดชอุดม 6',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 51, 51, 51))),
                ),
                // FlutterSwitch(value: status, onToggle: (val) {
                //   setState(() {
                //     status = val;
                //   });
                // })
                SizedBox(
                  height: 10,
                ),
                Text("\tเลขที่อาคาร/ชั้น"),
                SizedBox(
                  height: 5,
                ),
                TextField(
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
                    labelText: '',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Palette.kToDark),
                          value: SingingCharacter.lafayette,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        Text(
                          'บ้าน',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Palette.kToDark),
                          value: SingingCharacter.jefferson,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        Text(
                          'ที่ทำงาน',
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
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
                        onToggle: (val) {
                          setState(() {
                            status = val;
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
                      // side: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {
                    ;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "บันทึก",
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
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "ลบที่อยู่",
                        style: TextStyle(color: Palette.kToDark, fontSize: 15),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
        ));
  }
}