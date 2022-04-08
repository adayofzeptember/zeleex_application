import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/animal.dart';
import 'Plate.dart';
import 'store_page_detail_cattle.dart';

//backgroundColor: Colors.transparent,

void main(List<String> args) {
  runApp(Store_CattleDetail());
}

class Store_CattleDetail extends StatelessWidget {
  const Store_CattleDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: store_cattlesDetail_widget()));
  }

  
}

class store_cattlesDetail_widget extends StatefulWidget {
  store_cattlesDetail_widget({Key? key}) : super(key: key);

  @override
  State<store_cattlesDetail_widget> createState() =>
      _store_cattlesDetail_widgetState();
}

class _store_cattlesDetail_widgetState
    extends State<store_cattlesDetail_widget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Palette.kToDark,
          appBarTheme: AppBarTheme(color: Colors.white)),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Palette.kToDark,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {print("object")},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/call.svg'),
                    SizedBox(
                      width: 5,
                    ),
                    Text("ติดต่อร้านค้า")
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Colors.cyan,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {print("object")},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/callcenter.svg'),
                    SizedBox(
                      width: 5,
                    ),
                    Text("ติดต่อเจ้าหน้าที่")
                  ],
                ),
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: SizedBox(
                  child: Container(
                      color: Color.fromARGB(117, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/images/menu.svg',
                            color: Colors.white),
                      )),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Animals_Page()),
                    );
                  },
                  child: Container(
                    color: Color.fromARGB(117, 0, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          color: Color.fromARGB(117, 0, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/images/sort.svg',
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        color: Color.fromARGB(117, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/images/cart123.svg',
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset('assets/images/alpine-cow.png'),
            Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "จ้าวทศพล (YZ116) แบรนด์ดี",
                            style: TextStyle(
                                color: Color.fromARGB(255, 51, 51, 51),
                                fontSize: 20),
                          ),
                          SvgPicture.asset('assets/images/love.svg')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "฿ 170,000",
                            style:
                                TextStyle(color: Colors.red[400], fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "฿ 160,000",
                            style: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                decoration: TextDecoration.lineThrough),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset('assets/images/groupStar.svg'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                          child: Image.asset("assets/images/img.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ศรีไพศาลอาหารสัตว์-เกษตรภัณฑ์",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(
                                  "assets/images/store_pin.png",
                                ),
                                color: Colors.grey,
                              ),
                              Container(
                                child: Text(
                                  "จ. สุราษฎธานี",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage(
                                  "assets/images/phone.png",
                                ),
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "081 235 1234",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    child: Container(
                                      width: 80,
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Palette.kToDark,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Text(
                                        "ติดตาม",
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SvgPicture.asset('assets/images/vec.svg')],
                    ),
                    Text(
                      "รายละเอียดสัตว์",
                      style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51), fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
                      style:
                          TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset('assets/images/brazil.png'),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset('assets/images/brazil.png'),
                  ],
                ),
              ),
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     // Add your onPressed code here!
            //   },
            //   child: const Icon(Icons.navigation),
            // ),
          ],
        )),
      ),
    );
  }
}
