import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'Plate.dart';
import 'register.dart';



TermsWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Center(
        child: Column(
          children: [
            Text("โนยบายความเป็นส่วนตัว",
                style: TextStyle(
                    color: Palette.kToDark,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  "ยินดีต้อนรับสู่เว็บไซต์ www.zeleex.co.th และ/หรือ ZELEEXmobile app. กรุณาอ่านเงือนไขและข้อกำหนดเหล่านี้โดยละเอียดเงื่อนไขในการใช้บริการต่อไปนี้จะใช้บังคับกับการใช้งานและการเข้าถึงและการใช้บริการแพลตฟอร์มของท่าน (ดังที่นิยามไว้ด้านล่างนี้)ด้วยการเข้าถึงแพลตฟอร์มและ/หรือใช้บริการ ท่านตกลงที่จะผูกพันโดยเงื่อนไขในการใช้บริการนี้ หากท่านไม่ตกลงด้วยกับ..."),
            )
          ],
        ),
      ),
    ],
  );
}

ConditionWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Center(
        child: Column(children: [
          Text("เงื่อนไขการให้บริการ",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Palette.kToDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "เงื่อนไขยินดีต้อนรับสู่เว็บไซต์ www.zeleex.co.th และ/หรือ ZELEEXmobile app. กรุณาอ่านเงือนไขและข้อกำหนดเหล่านี้โดยละเอียดเงื่อนไขในการใช้บริการต่อไปนี้จะใช้บังคับกับการใช้งานและการเข้าถึงและการใช้บริการแพลตฟอร์มของท่าน (ดังที่นิยามไว้ด้านล่างนี้)ด้วยการเข้าถึงแพลตฟอร์มและ/หรือใช้บริการ ท่านตกลงที่จะผูกพันโดยเงื่อนไขในการใช้บริการนี้ หากท่านไม่ตกลงด้วยกับ...",
              textAlign: TextAlign.start,
            ),
          )
        ]),
      ),
    ],
  );
}

class TermsConditon extends StatefulWidget {
  TermsConditon({Key? key}) : super(key: key);

  @override
  State<TermsConditon> createState() => _TermsConditonState();
}

class _TermsConditonState extends State<TermsConditon> {
  var startedIndex = 0;

  List<Widget> _widgetsPages = [TermsWidget(), ConditionWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Palette.kToDark,
              elevation: 0,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80,
                  color: Palette.kToDark,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(
                        width: 5,
                      ),
                      FlutterToggleTab(
                        // width in percent, to set full width just set to 100
                        width: 80,
                        borderRadius: 10,
                        height: 50,
                        selectedIndex: startedIndex,
                        selectedBackgroundColors: [Colors.white],
                        // unSelectedBackgroundColors: [],
                        selectedTextStyle: TextStyle(
                            color: Palette.kToDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        unSelectedTextStyle: TextStyle(
                            color: Color.fromARGB(255, 131, 131, 131),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        labels: [
                          "นโยบายความเป็นส่วนตัว",
                          "เงื่อนไขการให้บริการ"
                        ],
                        selectedLabelIndex: (index) {
                          print("Selected Index $index");
                          setState(() {
                            startedIndex = index;
                          });
                        },
                      ),
                      Icon(
                        Icons.abc_sharp,
                        color: Palette.kToDark,
                      )
                    ],
                  ),
                ),
                _widgetsPages[startedIndex],
              ],
            ),
          ),
        );
  }
}
