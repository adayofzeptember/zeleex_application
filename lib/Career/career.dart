import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/Career/career_detail.dart';
import 'package:zeleex_application/main_widget.dart';
import '../Plate.dart';

void main() {
  runApp(Career_Page());
}


class Career_Page extends StatelessWidget {
  const Career_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Career(),
    );
  }
}

class Career extends StatefulWidget {
  Career({Key? key}) : super(key: key);
  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
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
              statusBarColor: Palette.kToDark,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            backgroundColor: Palette.kToDark,
            elevation: 0,
            title: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => mainpageWidget_only()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "ร่วมงานกับเรา",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.abc_sharp,
                    color: Palette.kToDark,
                  )
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              30,
              20,
              0,
            ),
            child: Column(
              
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/career.svg',
                        color: Color.fromARGB(255, 51, 51, 51)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "ตำแหน่งงาน",
                      style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            51,
                            51,
                            51,
                          ),
                          fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       elevation: 0,
                //       side:
                //           BorderSide(color: Color.fromARGB(255, 231, 231, 231)),
                //       primary: Colors.white,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(15),
                //       )),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       new MaterialPageRoute(
                //         builder: (context) => new Career_Detail(),
                //       ),
                //     );
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Container(
                //         width: double.infinity,
                //         alignment: Alignment.center,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             // SizedBox(
                //             //   width: 10,
                //             // ),
                //             SvgPicture.asset('assets/images/gg.svg'),
                //             SizedBox(
                //               width: 30,
                //             ),
                //             Text(
                //               "ดำเนินการต่อด้วยบัญชี Google",
                //               style: TextStyle(
                //                   color: Color.fromARGB(255, 51, 51, 51),
                //                   fontSize: 15),
                //             ),
                //           ],
                //         )),
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new Career_Detail(),
                      ),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Color.fromARGB(255, 206, 206, 206))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ครีเอทีฟ (1 ตำแหน่ง)",
                            style: TextStyle(
                                color: Palette.kToDark,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            decoration: BoxDecoration(
                              color: Palette.kToDark,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "รายละเอียด >",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Career_Detail(),
                      ),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Color.fromARGB(255, 206, 206, 206))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เจ้าหน้าที่ฟาร์มโคนม (2 ตำแหน่ง)",
                            style: TextStyle(
                                color: Palette.kToDark,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            decoration: BoxDecoration(
                              color: Palette.kToDark,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "รายละเอียด >",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Career_Detail(),
                      ),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Color.fromARGB(255, 206, 206, 206))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เจ้าหน้าที่การตลาด (1 ตำแหน่ง)",
                            style: TextStyle(
                                color: Palette.kToDark,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            decoration: BoxDecoration(
                              color: Palette.kToDark,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "รายละเอียด >",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}