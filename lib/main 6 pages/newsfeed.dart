import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/blogs_readall_api.dart';
import 'package:zeleex_application/main%206%20pages/main_page.dart';
import '../Career/career.dart';
import '../Plate.dart';
import '../aboutus.dart';
import '../help.dart';
import '../newsfeed_detail.dart';
import '../profile.dart';

void main(List<String> args) {
  runApp(NewsFeedPage());
}

class NewsFeedPage extends StatefulWidget {
  NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  late Future<List<Data_Blog_Detail>> future_blogs;
  void initState() {
    super.initState();
    future_blogs = fetch_Blog_readAll();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Kanit',
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 255, 255))),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark),
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsFeedPage_Detail(),
                    ));
                  },
                  child: Visibility(
                    visible: false,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "นิวส์ฟีด",
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/cart123.svg',
                      ),
                    ],
                  ),
                )
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5,0),
          child: Column(
            children: <Widget>[
           FutureBuilder<List<Data_Blog_Detail>>(
                future: future_blogs,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data_Blog_Detail>? data = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewsFeedPage_Detail()));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 20, 0, 0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  data![index]
                                                      .image!
                                                      .main
                                                      .toString()),
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 5, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      data[index]
                                                          .store!
                                                          .title
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 51, 51, 51),
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    data[index]
                                                        .createdAt
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Color.fromARGB(
                                                            255,
                                                            165,
                                                            162,
                                                            162)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          width: double.infinity,
                                          child: Image.network(
                                            data[index].image!.main.toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data[index].title.toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 51, 51, 51),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                                child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/love.svg',
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/images/sharefeed.svg',
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Text(
                                          data[index].content.toString(),
                                          // "แต่ถ้าเลี้ยงแบบครบวงจร ภาครัฐจัดหาน้ำเชื้อจากพ่อแม่พันธุ์ชั้นดีเกษตรกรนำมาผสมพันธุ์ แล้วเลี้ยงอนุบาลส่งต่อให้เกษตรกรที่พอมีกำลังทรัพย์นำมาขุนต่อด้วยเทคโนโลยีสมัยใหม่ ให้ ได้เนื้อวัวเกรดพรีเมียมมีไขมันแทรก ไม่ต่างจากเนื้อจากต่างประเทศราคาแพง",
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            color: Color.fromARGB(
                                                255, 130, 130, 130),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return Center(child: CircularProgressIndicator());
                },
              ),

           
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   color: Colors.white,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Padding(
              //           padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              //           child: Row(
              //             children: [
              //               CircleAvatar(
              //                 backgroundColor: Palette.kToDark,
              //                 child: Icon(
              //                   Icons.person,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text("Name Surename",
              //                         style: TextStyle(
              //                             color:
              //                                 Color.fromARGB(255, 51, 51, 51),
              //                             fontWeight: FontWeight.bold)),
              //                     SizedBox(
              //                       height: 5,
              //                     ),
              //                     Text(
              //                       "16 ธ.ค. 2565  07:54 น.",
              //                       style: TextStyle(
              //                           fontSize: 10,
              //                           color:
              //                               Color.fromARGB(255, 165, 162, 162)),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Container(
              //           child: Image.asset('assets/images/feed2.png'),
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
                              // "เลี้ยงโคเนื้อครบวงจร",
              //                 style: TextStyle(
              //                     color: Color.fromARGB(255, 51, 51, 51),
              //                     fontSize: 18,
              //                     fontWeight: FontWeight.bold),
              //               ),
              //               Container(
              //                   child: Row(
              //                 children: [
              //                   SvgPicture.asset(
              //                     'assets/images/love.svg',
              //                   ),
              //                   SizedBox(
              //                     width: 10,
              //                   ),
              //                   SvgPicture.asset(
              //                     'assets/images/sharefeed.svg',
              //                   ),
              //                 ],
              //               ))
              //             ],
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //           child: Text(
              //             "แต่ถ้าเลี้ยงแบบครบวงจร ภาครัฐจัดหาน้ำเชื้อจากพ่อแม่พันธุ์ชั้นดีเกษตรกรนำมาผสมพันธุ์ แล้วเลี้ยงอนุบาลส่งต่อให้เกษตรกรที่พอมีกำลังทรัพย์นำมาขุนต่อด้วยเทคโนโลยีสมัยใหม่ ให้ ได้เนื้อวัวเกรดพรีเมียมมีไขมันแทรก ไม่ต่างจากเนื้อจากต่างประเทศราคาแพง",
              //             style: TextStyle(
              //               fontFamily: 'Kanit',
              //               color: Color.fromARGB(255, 130, 130, 130),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20,
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color.fromARGB(232, 36, 28, 28), //desired color
            ),
            child: Container(
              width: 250,
              child: Drawer(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    0,
                    0,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  color: Palette.kToDark,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name Surname",
                                        style: TextStyle(
                                            color: Palette.kToDark,
                                            fontFamily: 'Kanit')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "ดูโปรไฟล์",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 165, 162, 162),
                                          fontFamily: 'Kanit'),
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
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Main_Page(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/new/home.svg',
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                  "หน้าหลัก",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Kanit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUs()));
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/new/about.svg',
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                  "เกี่ยวกับเรา",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Kanit'),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("ภายในร้าน",
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 162, 162),
                                fontFamily: 'Kanit')),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/tab4.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("สัตว์",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/tab5.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("สินค้า",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("object");
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/new/tab2.svg',
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text("ร้านค้า",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Kanit')),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/tab6.svg',
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("น้ำเชื้อ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kanit')),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("การช่วยเหลือ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 162, 162),
                                fontFamily: 'Kanit')),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HelpCenterPage()));
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/new/help2.svg',
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text("ศูนย์ช่วยเหลือ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Kanit')),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CareerPage()));
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/new/us.svg',
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text("ร่วมงานกับเรา",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Kanit')),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Divider(color: Color.fromARGB(255, 165, 162, 162)),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/new/logout.svg',
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text("ออกจากระบบ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Kanit')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
