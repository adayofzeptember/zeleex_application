import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../API/Read All/career_readall_api.dart';
import 'package:http/http.dart' as http;

import 'Others/Plate.dart';

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
    Data_Read_Careers careerDetail =
        Data_Read_Careers.fromJson(json.decode(response.body));
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
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: ZeleexColor.zeleexGreen),
        automaticallyImplyLeading: false,
        backgroundColor: ZeleexColor.zeleexGreen,
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
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              "รายละเอียดตำแหน่งงาน",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.abc_sharp,
              color: ZeleexColor.zeleexGreen,
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
                style: const TextStyle(
                    color: ZeleexColor.zeleexGreen, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "รายละเอียด",
                      style: TextStyle(
                          color: ZeleexColor.zeleexGreen, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "• คิดริเริ่มสร้างสรรค์ นำเสนอไอเดียใหม่ๆ ในการผลิตรายการโทรทัศน์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• หาข้อมูล, จดทำสคริปต์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• หาโลเคชัน นำเสนอโปรดิวเซอร์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• ออกกองควบคุมการถ่ายและกำกับพิธีกร",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• ควบคุมงานกราฟฟิคและงานตัดต่อที่ได้รับมอบหมาย",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "คุณสมบัติ",
                      style: TextStyle(
                          color: ZeleexColor.zeleexGreen, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "• มีประสบการณ์อย่างน้อย 1-3 ปี ในงานครีเอทีฟ",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• วุฒิการศึกษาปริญญาตรี สาขาวิชา นิเทศศาสตร์ วารสารศาสตร์ มนุษย์ศาสตร์ ศิลปศาสตร์ หรือสาขาอื่นๆที่เกี่ยวข้อง",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• มีความคิดริเริ่มสร้างสรรค์",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• มีความรับผิดชอบและสามารถปรับเวลาการทำงานให้เข้ากับรายการที่ได้รับมอบหมายได",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• สามารถปรับตัวได้ดีและอดทนต่อความกดดันในการทำงาน,การสร้างเรตติ้งและรายได้",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "สวัสดิการ",
                      style: TextStyle(
                          color: ZeleexColor.zeleexGreen, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "• เงินเดือน ตามข้อตกลงของบริษัท",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• ประกันชีวิตและอุบัติเหตุ",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• ค่ารักษาพยาบาล",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• กองทุนสำรองเลี้ยงชีพ",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• เงินช่วยเหลือสมรส",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• ทุนการศึกษาบุตรพนักงาน",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• ตรวจสุขภาพประจำปี",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• เงินช่วยเหลือสมรส",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• เครื่องแบบพนักงาน",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• เงินโบนัสประจำปี",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• ประกันสังคม",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                    const Text(
                      "• กองทุนเงินทดแทน",
                      style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(226, 243, 243, 243),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "วิธีีสมัครงาน",
                      style: TextStyle(
                          color: ZeleexColor.zeleexGreen, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
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
