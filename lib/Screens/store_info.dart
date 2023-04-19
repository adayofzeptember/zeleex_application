import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../Others/Plate.dart';
import '../bloc/store_all/store_all_bloc.dart';

class Store_Info extends StatelessWidget {
  @override
  String store_title;
  Store_Info(this.store_title);
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Colors.white,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Store_ProductPage(
                  //             storeID: widget.storeID,
                  //           )),
                  // )
                },
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/instore.svg',
                        color: ZeleexColor.zeleexGreen,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "สินค้าในร้าน",
                        style: TextStyle(color: ZeleexColor.zeleexGreen),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: MediaQuery.of(context).size.width * 0.4,
              child: FloatingActionButton(
                heroTag: "bt1",
                backgroundColor: ZeleexColor.zeleexGreen,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                onPressed: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Store_CattlePage(
                  //             storeID: widget.storeID,
                  //           )),
                  // )
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/malfoot.svg',
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("หมวดหมู่สัตว์")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            store_title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold,  color: ZeleexColor.zeleexGreen),
          ),
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          )),
      body: SingleChildScrollView(
        child: BlocBuilder<StoreAllBloc, StoreAllState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: JumpingText(
                      'กำลังโหลดร้านค้า...',
                      style: TextStyle(
                          fontSize: 25, color: ZeleexColor.zeleexGreen),
                    ),
                    // Text(
                    //   '. . .',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 25,
                    //   ),
                    // ),
                  ),
                ],
              );
            } else {
              String getContent = state.store_info.content.toString();
              var content = parse(getContent);
              return Column(
                children: [
                  Stack(
                    children: [
                      // CachedNetworkImage(
                      //         imageUrl: '',
                      //         fit: BoxFit.fill,
                      //         progressIndicatorBuilder:
                      //             (context, url, downloadProgress) =>
                      //                 Container(
                      //           color: Color.fromARGB(255, 142, 142, 142),
                      //           // height: 200,
                      //         ),
                      //         errorWidget: (context, url, error) => Center(
                      //           child: Container(
                      //             width: double.infinity,
                      //             height: MediaQuery.of(context).size.height *
                      //                 0.2,
                      //             decoration: BoxDecoration(
                      //               border: Border.all(
                      //                   color: Color.fromARGB(
                      //                       255, 240, 236, 236)),
                      //             ),
                      //             child: Image.asset(
                      //               'assets/images/banner-noimg.jpg',
                      //               fit: BoxFit.fitWidth,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 240, 236, 236)),
                        ),
                        child: Image.asset(
                          'assets/images/banner-noimg.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      //! หลังแบนเนอร์
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        child: const CircleAvatar(
                                          backgroundColor: Color.fromARGB(
                                              255, 196, 196, 196),
                                          backgroundImage: NetworkImage(
                                              'https://www.pngitem.com/pimgs/m/9-94800_online-store-icon-png-transparent-png.png'),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 5, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              state.store_info.title.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/pinnew.svg'),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                width: 200,

                                                //width: MediaQuery.of(context).size.width * 0.5,
                                                child: Text(
                                                  state.store_info.address
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/callnew.svg'),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                child: Text(
                                                  state.store_info.phone
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/star.svg'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(" 5.0 คะแนน | 5.2K ผู้ติดตาม"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // ElevatedButton(
                                      //   style: ElevatedButton.styleFrom(
                                      //       shape:
                                      //           RoundedRectangleBorder(
                                      //         borderRadius:
                                      //             BorderRadius.circular(
                                      //                 30),
                                      //       ),
                                      //       primary: pressed
                                      //           ? ZeleexColor
                                      //               .zeleexGreen
                                      //           : Color.fromARGB(
                                      //               255, 204, 204, 204),
                                      //       elevation: 0),
                                      //   onPressed: () {
                                      //     request_model_store_subscribe
                                      //             .user_id =
                                      //         cartAdd_userID.toString();

                                      //     request_model_store_subscribe
                                      //             .store_id =
                                      //         thisStore_notCoverIMG.id
                                      //             .toString();

                                      //     user_store_subscribe(
                                      //         request_model_store_subscribe,
                                      //         cartAdd_token);
                                      //     setState(() {
                                      //       pressed = !pressed;
                                      //     });
                                      //   },
                                      //   child: Text(
                                      //     pressed
                                      //         ? "ติดตาม"
                                      //         : "ติดตามแล้ว",
                                      //     style: TextStyle(
                                      //         color: Color.fromRGBO(
                                      //             255, 255, 255, 1)),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                //! แก้ไขเพิ่มเติม
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text("ประเภทร้านค้า "),
                                      Container(
                                        height: 20,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                state.store_info.types.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Row(
                                                children: [
                                                  Text(
                                                    state.store_info
                                                            .types[index]
                                                            .toString() +
                                                        ", ",
                                                    style: TextStyle(
                                                        color: ZeleexColor
                                                            .zeleexGreen),
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                    color: Color.fromARGB(255, 165, 162, 162)),
                                HtmlWidget(content.outerHtml),

                                const SizedBox(
                                  height: 20,
                                ),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.all(
                                //       Radius.circular(8)),
                                //   child: Image.asset(
                                //     'assets/images/detail1.png',
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
