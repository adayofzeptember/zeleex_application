import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../API/Read All/career_readall_api.dart';
import '../Plate.dart';
import 'package:http/http.dart' as http;

class Career_Detail extends StatefulWidget {
  String gotText = "";
  Career_Detail({Key? key, required this.gotText}) : super(key: key);

  @override
  State<Career_Detail> createState() => _Career_DetailState();
}

class _Career_DetailState extends State<Career_Detail> {
  Future<Data_Read_Careers> career_fetchByID() async {
    var blogID = widget.gotText.toString();
    var url = "https://sanboxapi.zeleex.com/api/careers/" + blogID;
    var response = await http.get(Uri.parse(url));
    Data_Read_Careers careerDetail = Data_Read_Careers.fromJson(json.decode(response.body));
    return careerDetail;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Palette.kToDark),
        automaticallyImplyLeading: false,
        backgroundColor: Palette.kToDark,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "รายละเอียดตำแหน่งงาน",
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
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        // child: FutureBuilder(
        //     future: career_ByID(),
        //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //       if (snapshot.hasData) {
        //         NewAPI msg = snapshot.data;
        //         // print("snap = " + msg.mess);
        //         return Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(msg.address!.geo!.lat.toString()),
        //             Text(msg.company!.name!.toString())
        //           ],
        //         );
        //         // return Image.network(
        //         //   msg.mess,
        //         //   width: 300,
        //         //   height: 200,
        //         // );
        //       } else {
        //         return CircularProgressIndicator();
        //       }
        //     }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "ไอดี: ${widget.gotText}",
                // "ครีเอทีฟ (1 ตำแหน่ง)",
                style: TextStyle(color: Palette.kToDark, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "รายละเอียด",
                      style: TextStyle(color: Palette.kToDark, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "• คิดริเริ่มสร้างสรรค์ นำเสนอไอเดียใหม่ๆ ในการผลิตรายการโทรทัศน์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• หาข้อมูล, จดทำสคริปต์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• หาโลเคชัน นำเสนอโปรดิวเซอร์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• ออกกองควบคุมการถ่ายและกำำับพิธีกร",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• ควบคุมงานกราฟฟิคและงานตัดต่อที่ได้รับมอบหมาย",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "คุณสมบัติ",
                      style: TextStyle(color: Palette.kToDark, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "• มีประสบการณ์อย่างน้อย 1-3 ปี ในงานครีเอทีฟ",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• วุฒิการศึกษาปริญญาตรี สาขาวิชา นิเทศศาสตร์ วารสารศาสตร์ มนุษย์ศาสตร์ ศิลปศาสตร์ หรือสาขาอื่นๆที่เกี่ยวข้อง",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• มีความคิดริเริ่มสร้างสรรค์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• มีความรับผิดชอบและสามารถปรับเวลาการทำงานให้เข้ากับรายการที่ได้รับมอบหมายได",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• สามารถปรับตัวได้ดีและอดทนต่อความกดดันในการทำงาน,การสร้างเรตติ้งและรายได้",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "สวัสดิการ",
                      style: TextStyle(color: Palette.kToDark, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "• เงินเดือน ตามข้อตกลงของบริษัท",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• ประกันชีวิตและอุบัติเหตุ",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• ค่ารักษาพยาบาล",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• กองทุนสำรองเลี้ยงชีพ",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• เงินช่วยเหลือสมรส",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• ทุนการศึกษาบุตรพนักงาน",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• ตรวจสุขภาพประจำปี",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• เงินช่วยเหลือสมรส",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• เครื่องแบบพนักงาน",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• เงินโบนัสประจำปี",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• ประกันสังคม",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    Text(
                      "• กองทุนเงินทดแทน",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "วิธีีสมัครงาน",
                      style: TextStyle(color: Palette.kToDark, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "• รับสมัครงานผ่านทาง อีเมล สามารถส่ง Resume มาได้ที่ zeleex@gmail.com",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
