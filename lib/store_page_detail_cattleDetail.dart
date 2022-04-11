import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/main%206%20pages/animal.dart';
import 'Plate.dart';
import 'store_page_detail_cattle.dart';

class Store_Cattle_Detail extends StatefulWidget {
  Store_Cattle_Detail({Key? key}) : super(key: key);

  @override
  State<Store_Cattle_Detail> createState() => _Store_Cattle_DetailState();
}

class _Store_Cattle_DetailState extends State<Store_Cattle_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Palette.kToDark,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {},
                child: Container(
              
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/call.svg',
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "ติดต่อร้านค้า",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Colors.cyan,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/callcenter.svg',
                      color: Colors.white,
                    ),
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
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       width: 150,
      //       child: FloatingActionButton(
      //         backgroundColor: Palette.kToDark,
      //         shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      //         onPressed: () => {print("object")},
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SvgPicture.asset('assets/images/call.svg'),
      //             SizedBox(
      //               width: 5,
      //             ),
      //             Text("ติดต่อร้านค้าxx")
      //           ],
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       width: 5,
      //     ),
      //     Container(
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.all(Radius.circular(10))),
      //       width: 150,
      //       child: FloatingActionButton(
      //         backgroundColor: Colors.cyan,
      //         shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      //         onPressed: () => {print("object")},
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SvgPicture.asset('assets/images/callcenter.svg'),
      //             SizedBox(
      //               width: 5,
      //             ),
      //             Text("ติดต่อเจ้าหน้าที่")
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/menu-61.png",
                    ),
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
              Text("หมวดหมู่สัตว์",
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold)),
              Row(
                children: [
               
                  SvgPicture.asset(
                    'assets/images/cart123.svg',
                  )
                ],
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
              padding: const EdgeInsets.all(10.0),
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
                                      borderRadius: BorderRadius.circular(30.0),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [SvgPicture.asset('assets/images/vec.svg')],
                  // ),
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
                    style: TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset('assets/images/brazil.png'),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset('assets/images/brazil.png'),
                   SizedBox(
                    height: 80,
                  ),
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
    );
  }
}
