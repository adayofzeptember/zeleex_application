import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/API/Read%20All/cart_getUserCartList.dart';
import 'package:zeleex_application/API/Read%20All/shipping_list.dart';
import 'package:zeleex_application/API/Read%20By%20ID/profile_token.dart';
import 'package:zeleex_application/Career/career.dart';
import 'package:zeleex_application/from%20Profile/buying_list.dart';
import 'package:zeleex_application/help.dart';
import 'package:zeleex_application/login.dart';
import 'package:zeleex_application/second.dart';
import 'package:zeleex_application/terms.dart';
import '../API/Post Method/google_login_api.dart';
import '../API/Read By ID/blog_id_api.dart';
import '../API/Read By ID/product_review.dart';
import '../Plate.dart';
import '../cart.dart';
import 'history/history.dart';
import 'package:http/http.dart' as http;
import 'likes/likes.dart';
import '../payment_address.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

String theTokenOne = '';
String theUserOne = '';

class _ProfilePageState extends State<ProfilePage> {
  late Future<Data_Profile> future_Profile;
  late Future<List<Data_Shipping_List>> fetched_add;

  Future logout_removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('keyID');
    prefs.remove('keyToken');
    prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  Future getToken() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var x = prefs2.get('keyToken');
    var y = prefs2.get('keyID');
    setState(() {
      theTokenOne = x.toString();
      theUserOne = y.toString();
    });
    

  }

  Future<Data_Profile> fetchProfile_Auth(String token) async {
    var url = "https://api.zeleex.com/api/profile";
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data'];
    Data_Profile user_profileData = Data_Profile.fromJson(jsonCon);

    return user_profileData;
  }

  @override
  void initState() {
    getToken();

    print('TTTTTTTTTTTTTTT' + theTokenOne.toString());

    fetched_add = fetch_shipping_list(theTokenOne);
    //future_Profile = fetchProfile_Auth('f');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: Palette.kToDark,
        ),
        backgroundColor: Palette.kToDark,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: false,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              "โปรไฟล์",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/images/cart123.svg',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future: fetchProfile_Auth(theTokenOne),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    Data_Profile prf = snapshot.data;
                    return Container(
                      decoration: BoxDecoration(
                          color: Palette.kToDark,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 20, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 141, 141, 141),
                              ),
                              errorWidget: (context, url, error) => SizedBox(
                                height: 60,
                                width: 60,
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    color: Palette.kToDark,
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 224, 224, 224),
                                ),
                              ),
                              imageUrl: prf.avatar.toString(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(prf.name.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kanit',
                                          fontSize: 20,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "แก้ไขโปรไฟล์",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                          fontFamily: 'Kanit',
                                          fontSize: 12,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(color: Palette.kToDark),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/buy.svg',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("การสั่งซื้อ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryPage()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "ประวัติการสั่งซื้อ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 130, 130, 130),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 130, 130, 130),
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyingListPage(
                              indexTab: 0,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/wallet.svg',
                            height: MediaQuery.of(context).size.height * 0.035,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "ที่ต้องชำระ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/arrowright.svg',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyingListPage(indexTab: 1),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/box.svg',
                            height: MediaQuery.of(context).size.height * 0.035,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "เตรียมจัดส่ง",
                            style: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/arrowright.svg',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyingListPage(indexTab: 2),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/shipp.svg',
                            height: MediaQuery.of(context).size.height * 0.035,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "กำลังจัดส่ง",
                            style: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/arrowright.svg',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryPage(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/score.svg',
                            height: MediaQuery.of(context).size.height * 0.035,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "ให้คะแนน",
                            style: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LikesPage(),
                  ),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 241, 241, 241)),
                  )),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/heart.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "สิ่งที่ถูกใจ",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            FutureBuilder<List<Data_Shipping_List>>(
              future: fetch_shipping_list(theTokenOne),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Data_Shipping_List>? data = snapshot.data;
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Payment_Address(),
                                //   ),
                                // );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 241, 241, 241))),
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/pin.svg'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "ที่อยู่หลัก",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.015,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    data![0].name.toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 130, 130, 130),
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.015),
                                                  ),
                                                  Text(
                                                    "\t (ค่าเริ่มต้น)",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.015),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                ],
                                              ),
                                              // Icon(
                                              //   Icons.arrow_forward_ios_rounded,
                                              //   color: Color.fromARGB(
                                              //       255, 130, 130, 130),
                                              //   size: 15,
                                              // )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 0, 0, 0),
                                            child: Container(
                                              width: 250,
                                              child: Text(
                                                data[0].phone.toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 130, 130, 130),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015),
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 0, 0, 0),
                                            child: Container(
                                              width: 350,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data[0].address.toString() +
                                                        ' ' +
                                                        data[0]
                                                            .district
                                                            .toString() +
                                                        ' ' +
                                                        data[0]
                                                            .province
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                      color: Color.fromARGB(
                                                          255, 130, 130, 130),
                                                    ),
                                                  ),
                                                  Text(
                                                    data[0].city.toString() +
                                                        ' ' +
                                                        data[0]
                                                            .postcode
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                      color: Color.fromARGB(
                                                          255, 130, 130, 130),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Container(
                  child: Text('...'),
                );
              },
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Palette.kToDark),
                      primary: Palette.kToDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/store2.svg'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "เริ่มการขาย ลงทะเบียนฟรี",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermsConditon()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241)),
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241)))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/edit.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "นโยบายความเป็นส่วนตัว",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelpCenterPage()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241)))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/Frame.svg',
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ศูนย์ช่วยเหลือ",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CareerPage()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241)))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/new/work.svg',
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ร่วมงานกับเรา",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(30, 20, 30, 1),
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           side: BorderSide(color: Color.fromARGB(255, 95, 95, 95)),
            //           primary: Color.fromARGB(255, 255, 255, 255),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           )),
            //       onPressed: () {},
            //       child: Padding(
            //         padding: const EdgeInsets.all(12.0),
            //         child: Container(
            //           width: double.infinity,
            //           child: Text(
            //             "เปลี่ยนบัญชีผู้ใช้",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               color: Color.fromARGB(255, 130, 130, 130),
            //               fontSize: 15,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color.fromARGB(255, 95, 95, 95)),
                      primary: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    logout_removeToken();
                    GoogoleSignInApi.google_LogOut();
                    FacebookAuth.instance.logOut().then((value) {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "ออกจากระบบ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 130, 130, 130),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
