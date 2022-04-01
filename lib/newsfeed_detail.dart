import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Plate.dart';
import 'newsfeed.dart';

void main() {
  runApp(NewsFeedDetailPage());
}

class NewsFeedDetailPage extends StatelessWidget {
  const NewsFeedDetailPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      home: newsFeedDetail_widget(),
    );
  }
}

class newsFeedDetail_widget extends StatefulWidget {
  newsFeedDetail_widget({Key? key}) : super(key: key);

  @override
  State<newsFeedDetail_widget> createState() => _newsFeedDetail_widget();
}

class _newsFeedDetail_widget extends State<newsFeedDetail_widget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Colors.teal,
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 255, 255))),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: SizedBox(
                  child: SvgPicture.asset(
                    'assets/images/menu.svg',
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsFeedPage()));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "นิวส์ฟีด",
                  style: TextStyle(color: Palette.kToDark),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/cart123.svg',
                        color: Color.fromARGB(255, 51, 51, 51),
                      ),
                    ],
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
                        child: Text(
                          "เลี้ยงโคเนื้อครบวงจร",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 51, 51, 51)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child:
                            Divider(color: Color.fromARGB(255, 165, 162, 162)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "16 ธ.ค. 2565  07:54 น.",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 165, 162, 162)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/Share.svg',
                                ),
                                SvgPicture.asset(
                                  'assets/images/Like.svg',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/images/cows1.png'),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\t\t\tแต่ถ้าเลี้ยงแบบครบวงจร ภาครัฐจัดหาน้ำเชื้อจากพ่อแม่พันธุ์ชั้นดีเกษตรกรนำมาผสมพันธุ์แล้วเลี้ยงอนุบาลส่งต่อให้เกษตรกรที่พอมีกำลังทรัพย์นำมาขุนต่อด้วยเทคโนโลยีสมัยใหม่ให้ได้เนื้อวัวเกรดพรีเมียมมีไขมันแทรกไม่ต่างจากเนื้อจากต่างประเทศราคาแพง มีการรวมตัวกันเป็นเครือข่าย แล้วก็มีห้างโมเดิร์นเทรดมารับซื้อในราคาสูง...มีให้เห็นน้อยมาก",
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Image.asset('assets/images/cows2.png'),
                            ),
                            Text(
                                "\t\t\tเลี้ยงวัวมากว่า 20 ปี เริ่มต้นจากไม่กี่ตัว ลองผิดลองถูกมา หลายสูตรสุดท้าย มาคิดได้ ไม่มีอะไรยั่งยืนไปกว่าการรวมกลุ่มทำ ตามที่ตัวเองถนัด แล้วทำของดีเกรด พรีเมียมออกมา ขายได้ราคา สูง จากนั้นเลยให้ชาวบ้านที่ยังไม่มีทุนมากนัก นำลูกวัว ไปเลี้ยง อนุบาล 1 ปีในรายที่พอมีความรู้ผสมพันธุ์ก็สามารถเอาน้ำเชื้อจาก กรม ปศุสัตว์มาผสมเอง แล้วนำมาขายต่อให้เรานำมาเลี้ยงขุนใน ระบบอีเวป เพื่อให้ได้วัวที่มี ลักษณะดี กล้ามเนื้อครบถ้วน จนปัจจุบันบนเนื้อที่ 150 ไร่ มีวัวขุนกว่า 3,000 ตัว และวัวที่พร้อมจะเป็นวัวขุนอีกไม่น้อยกว่า 3,000 ตัว”"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                " \t\t\tวิบูลย์ ไวยสุระสิงห์ เจ้าของสุระสิงห์ฟาร์ม และประธานสหกรณ์ เครือข่ายโคเนื้อ จำกัด ต.ชากบก อ.บ้านค่าย จ.ระยอง บอกถึงที่มา ของการรวมกลุ่มผลิตวัวเนื้อ เกรดพรีเมียม ที่มี บริษัท สยามแม็ค โคร จำกัด (มหาชน) จะเข้ามารับซื้อไม่ต่ำ กว่าเดือนละ 60,000 แพ็ก"),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset('assets/images/man.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "กรวัฒน์ วีนิล",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}