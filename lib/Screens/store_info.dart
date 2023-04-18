import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import '../Others/Plate.dart';
import '../bloc/store_all/store_all_bloc.dart';

class Store_Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "ร้านค้า",
            style: TextStyle(fontWeight: FontWeight.bold),
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
                  const Center(
                    child: Text(
                      '. . .',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
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
                              color: Color.fromARGB(255, 240, 236, 236)),
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
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
                                        child: CircleAvatar(
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
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/pinnew.svg'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                width: 200,

                                                //width: MediaQuery.of(context).size.width * 0.5,
                                                child: Text(
                                                  state.store_info.address
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/callnew.svg'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                child: Text(
                                                  state.store_info.phone
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                              ),
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
                                SizedBox(
                                  height: 10,
                                ),

                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/star.svg'),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(" 5.0 คะแนน | 5.2K ผู้ติดตาม"),
                                      SizedBox(
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
                                // Padding(
                                //   padding: const EdgeInsets.fromLTRB(
                                //       15, 5, 0, 0),
                                //   child: Row(
                                //     children: <Widget>[
                                //       Text("ประเภทร้านค้า "),
                                //       Container(
                                //         height: 20,
                                //         child: ListView.builder(
                                //             shrinkWrap: true,
                                //             scrollDirection:
                                //                 Axis.horizontal,
                                //             itemCount:
                                //                 thisStore_notCoverIMG
                                //                     .types!.length,
                                //             itemBuilder:
                                //                 (BuildContext context,
                                //                     int index) {
                                //               return Row(
                                //                 children: [
                                //                   Text(
                                //                     thisStore_notCoverIMG
                                //                             .types![
                                //                                 index]
                                //                             .title
                                //                             .toString() +
                                //                         ", ",
                                //                     style: TextStyle(
                                //                         color: ZeleexColor
                                //                             .zeleexGreen),
                                //                   ),
                                //                 ],
                                //               );
                                //             }),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                    color: Color.fromARGB(255, 165, 162, 162)),
                                HtmlWidget(content.outerHtml),
                                

                                SizedBox(
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
