// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import '../../Others/Plate.dart';

class TermsConditon extends StatefulWidget {
  const TermsConditon({Key? key}) : super(key: key);

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
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: ZeleexColor.zeleexGreen,
          ),
          backgroundColor: ZeleexColor.zeleexGreen,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: ZeleexColor.zeleexGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  FlutterToggleTab(
                    // width in percent, to set full width just set to 100
                    width: 80,
                    borderRadius: 10,
                    height: 50,
                    selectedIndex: startedIndex,
                    selectedBackgroundColors: const [Colors.white],
                    // unSelectedBackgroundColors: [],
                    selectedTextStyle: const TextStyle(
                        color: ZeleexColor.zeleexGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    unSelectedTextStyle: const TextStyle(
                        color: Color.fromARGB(255, 131, 131, 131),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    labels: const [
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
                  const Icon(
                    Icons.abc_sharp,
                    color: ZeleexColor.zeleexGreen,
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

//*--------------------------------------
TermsWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(
        height: 20,
      ),
      Center(
        child: Column(
          children: const [
            Text("โนยบายความเป็นส่วนตัว",
                style: TextStyle(
                    color: ZeleexColor.zeleexGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(20.0),
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
      const SizedBox(
        height: 20,
      ),
      Center(
        child: Column(children: const [
          Text("เงื่อนไขการให้บริการ",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ZeleexColor.zeleexGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(20.0),
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
