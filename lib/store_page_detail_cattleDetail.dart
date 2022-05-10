import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/API/Read%20By%20ID/animal_id_API.dart';
import 'package:zeleex_application/main%206%20pages/animal.dart';
import 'Plate.dart';
import 'store_page_detail_cattle.dart';
import 'package:http/http.dart' as http;

class Store_Cattle_Detail extends StatefulWidget {
  String? animalID = "";
  String? animalName = "";

  Store_Cattle_Detail({Key? key, this.animalID, this.animalName})
      : super(key: key);

  @override
  State<Store_Cattle_Detail> createState() => _Store_Cattle_DetailState();
}

class _Store_Cattle_DetailState extends State<Store_Cattle_Detail> {
  Future<Animal> fetch_Animal_ByID() async {
    var url = "https://sanboxapi.zeleex.com/api/animals/" +
        widget.animalID.toString();
    var response = await http.get(Uri.parse(url));
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data']['animal'];
    Animal msg = Animal.fromJson(jsonCon);

    return msg;
  }

  bool pressed = true;

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
                heroTag: "btn1",
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
                heroTag: "btndd1",
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
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark),
          backgroundColor: Colors.white,
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
              Text(widget.animalName.toString(),
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
        children: <Widget>[
          FutureBuilder(
              future: fetch_Animal_ByID(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  Animal thisAnimal = snapshot.data;
                  return Column(
                    //! container คลุม column
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: thisAnimal.image!.main.toString(),
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                          color: Color.fromARGB(255, 142, 142, 142),
                          height: 400,
                        ),
                        errorWidget: (context, url, error) => Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 141, 141, 141))),
                                alignment: Alignment.center,
                                child: Text("ไม่พบรูปภาพของบล็อก")),
                          ),
                        ),
                      ),
                      // Image.network(thisAnimal.image!.main.toString()),
                      Container(
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${thisAnimal.title}",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
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
                                      "฿ ${thisAnimal.price}",
                                      style: TextStyle(
                                          color: Colors.red[400], fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "฿ ${thisAnimal.price}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 130, 130, 130),
                                          decoration:
                                              TextDecoration.lineThrough),
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
                                  backgroundImage: NetworkImage(
                                      thisAnimal.image!.thumbnail.toString()),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(thisAnimal.store!.title.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/pincat.svg',
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          child: Text(
                                            thisAnimal.store!.address
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/telcat.svg',
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              thisAnimal.store!.phone
                                                  .toString(),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              primary: pressed
                                                  ? Palette.kToDark
                                                  : Color.fromARGB(
                                                      255, 204, 204, 204),
                                              elevation: 0),
                                          onPressed: () {
                                            setState(() {
                                              pressed = !pressed;
                                            });
                                          },
                                          //         style: pressed
                                          // ? TextStyle(
                                          //     color: Colors.black)
                                          // : TextStyle(
                                          //     color: Color.fromARGB(255, 229, 233, 229)),
                                          child: Text(
                                            pressed ? "ติดตาม" : "ติดตามแล้ว",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                                    color: Color.fromARGB(255, 51, 51, 51),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                thisAnimal.description.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 130, 130, 130)),
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
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              }),
          // Image.asset('assets/images/alpine-cow.png'),
          // Container(
          //   color: Colors.white,
          //   child: Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 "จ้าวทศพล (YZ116) แบรนด์ดี",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 51, 51, 51),
          //                     fontSize: 20),
          //               ),
          //               SvgPicture.asset('assets/images/love.svg')
          //             ],
          //           ),
          //           SizedBox(
          //             height: 5,
          //           ),
          //           Row(
          //             children: [
          //               Text(
          //                 "฿ 170,000",
          //                 style:
          //                     TextStyle(color: Colors.red[400], fontSize: 20),
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Text(
          //                 "฿ 160,000",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 130, 130, 130),
          //                     decoration: TextDecoration.lineThrough),
          //               )
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           SvgPicture.asset('assets/images/groupStar.svg'),
          //           SizedBox(
          //             height: 10,
          //           ),
          //         ],
          //       )),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           height: 50,
          //           width: 50,
          //           child: CircleAvatar(
          //               child: Image.asset("assets/images/img.png")),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("ศรีไพศาลอาหารสัตว์-เกษตรภัณฑ์",
          //                   style: TextStyle(fontWeight: FontWeight.bold)),
          //               Row(
          //                 children: [
          //                   ImageIcon(
          //                     AssetImage(
          //                       "assets/images/store_pin.png",
          //                     ),
          //                     color: Colors.grey,
          //                   ),
          //                   Container(
          //                     child: Text(
          //                       "จ. สุราษฎธานี",
          //                       style: TextStyle(color: Colors.grey),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   ImageIcon(
          //                     AssetImage(
          //                       "assets/images/phone.png",
          //                     ),
          //                     color: Colors.grey,
          //                   ),
          //                   Row(
          //                     children: [
          //                       ImageIcon(
          //                         AssetImage(
          //                           "assets/images/phone.png",
          //                         ),
          //                         color: Colors.grey,
          //                       ),
          //                       Text(
          //                         "081 235 1234",
          //                         style: TextStyle(color: Colors.grey),
          //                       ),
          //                       SizedBox(
          //                         width: 5,
          //                       ),
          //                       ElevatedButton(
          //                         style: ElevatedButton.styleFrom(
          //                             shape: RoundedRectangleBorder(
          //                               borderRadius: BorderRadius.circular(30),
          //                             ),
          //                             primary: pressed
          //                                 ? Palette.kToDark
          //                                 : Color.fromARGB(255, 204, 204, 204),
          //                             elevation: 0),
          //                         onPressed: () {
          //                           setState(() {
          //                             pressed = !pressed;
          //                           });
          //                         },
          //                         //         style: pressed
          //                         // ? TextStyle(
          //                         //     color: Colors.black)
          //                         // : TextStyle(
          //                         //     color: Color.fromARGB(255, 229, 233, 229)),
          //                         child: Text(
          //                           pressed ? "ติดตาม" : "ติดตามแล้ว",
          //                           style: TextStyle(
          //                               color:
          //                                   Color.fromRGBO(255, 255, 255, 1)),
          //                         ),
          //                       ),
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //         Icon(
          //           Icons.settings,
          //           color: Colors.white,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   width: double.infinity,
          //   color: Colors.white,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.end,
          //         //   children: [SvgPicture.asset('assets/images/vec.svg')],
          //         // ),
          //         Text(
          //           "รายละเอียดสัตว์",
          //           style: TextStyle(
          //               color: Color.fromARGB(255, 51, 51, 51), fontSize: 20),
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           "ทีเด็ดพ่อพันธุ์บราห์มัน จ้าวทศพล (YZ116) แบรนด์ดี พันธุกรรมระดับโลก",
          //           style: TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
          //         ),
          //         SizedBox(
          //           height: 15,
          //         ),
          //         Image.asset('assets/images/brazil.png'),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Image.asset('assets/images/brazil.png'),
          //         SizedBox(
          //           height: 80,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }
}
