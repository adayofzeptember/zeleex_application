import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'Plate.dart';

void main(List<String> args) {
  runApp(AboutUs());
}

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);



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
                  onTap: () {
                          // Navigator.pushReplacement(context,
                          // MaterialPageRoute(builder: (context) => mainpageWidget_ony()));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "เกี่ยวกับเรา",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.abc_sharp,
                  color: Palette.kToDark,
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                    // FlutterToggleTab(
                    //   // width in percent, to set full width just set to 100
                    //   width: 90,
                    //   borderRadius: 0,
                    //   height: 50,

                    //   selectedTextStyle: TextStyle(

                    //       color: Colors.white,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w700),
                    //   unSelectedTextStyle: TextStyle(
                    //       color: Colors.black87,
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500),
                    //   labels: ["Tab A (10)", "Tab B (6)", "Tab C (9)"],
                    //   selectedLabelIndex: (index) {
                    //     print("Selected Index $index");
                    //   },
                    //   selectedIndex: 0,
                    // ),
                    Image.asset('assets/images/aboutus.png'),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text(
                          "Ldddorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}