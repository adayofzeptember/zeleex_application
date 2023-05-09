import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/from%20Profile/buying_list.dart';
import 'package:zeleex_application/help.dart';
import 'package:zeleex_application/login.dart';
import 'package:zeleex_application/terms.dart';
import '../../API/Post Method/google_login_api.dart';
import '../../Others/Plate.dart';
import '../../Others/shape.dart';
import '../../bloc/profile/profile_bloc.dart';
import '../../career.dart';
import '../../cart.dart';
import '../../from Profile/history/history.dart';
import '../../from Profile/likes/likes.dart';
import '../../address_manage_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  // Future logout_removeToken() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: ZeleexColor.zeleexGreen,
        ),
        backgroundColor: ZeleexColor.zeleexGreen,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "โพรไฟล์",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                child: SvgPicture.asset(
                  'assets/images/cart123.svg',
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.loading == true) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
          return SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(height: 50),
                ),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: ZeleexColor.zeleexGreen,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 20, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  color: ZeleexColor.zeleexGreen,
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 224, 224, 224),
                              ),
                            ),
                            // CachedNetworkImage(
                            //   imageBuilder: (context, imageProvider) =>
                            //       Container(
                            //     height: 60,
                            //     width: 60,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       image: DecorationImage(
                            //           image: imageProvider, fit: BoxFit.cover),
                            //     ),
                            //   ),
                            //   placeholder: (context, url) => CircleAvatar(
                            //     backgroundColor:
                            //         Color.fromARGB(255, 141, 141, 141),
                            //   ),
                            //   errorWidget: (context, url, error) =>
                            //   SizedBox(
                            //     height: 60,
                            //     width: 60,
                            //     child: CircleAvatar(
                            //       child: Icon(
                            //         Icons.person,
                            //         color: ZeleexColor.zeleexGreen,
                            //       ),
                            //       backgroundColor:
                            //           Color.fromARGB(255, 224, 224, 224),
                            //     ),
                            //   ),
                            //   imageUrl: prf.avatar.toString(),
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.profile_data.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kanit',
                                          fontSize: 20,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "แก้ไขโพรไฟล์",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                          fontFamily: 'Kanit',
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Icon(
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
                    ),
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
                              const SizedBox(
                                width: 5,
                              ),
                              Text("การสั่งซื้อ",
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 51, 51, 51),
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015)),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: const Duration(milliseconds: 250),
                                  type: PageTransitionType.fade,
                                  child: HistoryPage(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "ประวัติการสั่งซื้อ",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 130, 130, 130),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                ),
                                const Icon(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
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
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BuyingListPage(indexTab: 1),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/box.svg',
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BuyingListPage(indexTab: 2),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/shipp.svg',
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
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
                          GestureDetector(
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
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 250),
                            type: PageTransitionType.fade,
                            child: LikesPage(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(
                                color: Color.fromARGB(255, 241, 241, 241)),
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
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "สิ่งที่ถูกใจ",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Icon(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: const Duration(milliseconds: 250),
                                type: PageTransitionType.fade,
                                child: Address_Manage_Page(),
                              ),
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 241, 241, 241))),
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/pin.svg'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "ที่อยู่หลัก",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
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
                                                state.address_data[0].name,
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 130, 130, 130),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015),
                                              ),
                                              Text(
                                                "\t (ค่าเริ่มต้น)",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 0, 0, 0),
                                        child: Container(
                                          width: 250,
                                          child: Text(
                                            state.address_data[0].phone,
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 130, 130, 130),
                                                fontSize: MediaQuery.of(context)
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
                                                state.address_data[0].address +
                                                    ' ' +
                                                    state.address_data[0]
                                                        .district +
                                                    ' ' +
                                                    state.address_data[0]
                                                        .province,
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.015,
                                                  color: const Color.fromARGB(
                                                      255, 130, 130, 130),
                                                ),
                                              ),
                                              Text(
                                                state.address_data[0].city +
                                                    ' ' +
                                                    state.address_data[0]
                                                        .postcode,
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.015,
                                                  color: const Color.fromARGB(
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
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: ZeleexColor.zeleexGreen),
                              primary: ZeleexColor.zeleexGreen,
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
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
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
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 250),
                            type: PageTransitionType.fade,
                            child: TermsConditon(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color:
                                          Color.fromARGB(255, 241, 241, 241)),
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(255, 241, 241, 241)))),
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
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "นโยบายความเป็นส่วนตัว",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Icon(
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
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 250),
                            type: PageTransitionType.fade,
                            child: HelpCenterPage(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(255, 241, 241, 241)))),
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
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ศูนย์ช่วยเหลือ",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Icon(
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
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 250),
                            type: PageTransitionType.fade,
                            child: CareerPage(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(255, 241, 241, 241)))),
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
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ร่วมงานกับเรา",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Icon(
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
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 95, 95, 95)),
                              primary: const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            // logout_removeToken();
                            GoogoleSignInApi.google_LogOut();
                            FacebookAuth.instance.logOut().then((value) {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: double.infinity,
                              child: const Text(
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
              ],
            ),
          );
        },
      ),
    );
  }
}
