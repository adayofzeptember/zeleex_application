// ignore_for_file: must_be_immutable, camel_case_types, deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:zeleex_application/Others/Plate.dart';
import 'package:zeleex_application/bloc/store_all/store_all_bloc.dart';
import 'package:zeleex_application/bloc/store_indiv_products_animals_bloc/store_indiv_products_animals_bloc.dart';

class Store_Info extends StatelessWidget {
  String store_title;
  Store_Info(this.store_title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreAllBloc, StoreAllState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return Scaffold(
              body: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: JumpingText(
                  'กำลังโหลด...',
                  style: const TextStyle(
                      fontSize: 25,
                      color: ZeleexColor.zeleexGreen,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ));
        } else {
          String getContent = state.store_info.content.toString();
          var content = parse(getContent);
          return Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: ZeleexColor.zeleexGreen,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                            )),
                        onPressed: (state.botton == 0)
                            ? (() {
                                context
                                    .read<StoreAllBloc>()
                                    .add(PressBotton(getIntBotton: 1));
                                context
                                    .read<StoreIndivProductsAnimalsBloc>()
                                    .add(ClearList());
                                context
                                    .read<StoreIndivProductsAnimalsBloc>()
                                    .add(Load_ProductsInStore(
                                        getStoreID:
                                            state.store_info.id.toString()));
                              })
                            : null,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/instore.svg',
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "สินค้าในร้าน",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: ZeleexColor.zeleexGreen,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            )),
                        onPressed: (state.botton == 1)
                            ? (() {
                                context
                                    .read<StoreAllBloc>()
                                    .add(PressBotton(getIntBotton: 0));
                                context
                                    .read<StoreIndivProductsAnimalsBloc>()
                                    .add(ClearList());
                                context
                                    .read<StoreIndivProductsAnimalsBloc>()
                                    .add(Load_AnimalsInStore(
                                        getStoreID:
                                            state.store_info.id.toString()));
                              })
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/malfoot.svg',
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "หมวดหมู่สัตว์",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ZeleexColor.zeleexGreen),
                  ),
                  leading: IconButton(
                    onPressed: () async {
                      context
                          .read<StoreAllBloc>()
                          .add(PressBotton(getIntBotton: 1));

                      context
                          .read<StoreIndivProductsAnimalsBloc>()
                          .add(ClearList());

                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  )),
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
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
                                color:
                                    const Color.fromARGB(255, 240, 236, 236)),
                          ),
                          child: Image.asset(
                            'assets/images/banner-noimg.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        //! หลังแบนเนอร์
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
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
                                                    state.store_info.title
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                                                    SizedBox(
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
                                                    Text(
                                                      state.store_info.phone
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/star.svg'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                                " 5.0 คะแนน | 5.2K ผู้ติดตาม"),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 10, 0, 0),
                                        child: Row(
                                          children: <Widget>[
                                            const Text("ประเภทร้านค้า "),
                                            SizedBox(
                                              height: 20,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: state
                                                      .store_info.types.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Row(
                                                      children: [
                                                        Text(
                                                          state.store_info
                                                                  .types[index]
                                                                  .toString() +
                                                              ", ",
                                                          style: const TextStyle(
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
                                          color: Color.fromARGB(
                                              255, 165, 162, 162)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      HtmlWidget(content.outerHtml),

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
                            
                              BlocBuilder<StoreIndivProductsAnimalsBloc,
                                  StoreIndivProductsAnimalsState>(
                                builder: (context, stateDatas) {
                                  if (stateDatas.loading == true) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          CircularProgressIndicator(
                                            color: ZeleexColor.zeleexGreen,
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    if (stateDatas.products_inStore.isEmpty) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Text(
                                              stateDatas.count_Check.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 228, 115, 107)),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return GridView.builder(
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.35,
                                          ),
                                          itemCount: stateDatas
                                              .products_inStore.length,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      print('product id: ' +
                                                          stateDatas
                                                              .products_inStore[
                                                                  index]
                                                              .id
                                                              .toString());

                                                      // context.read<ProductsBloc>().add(
                                                      //       Load_ProductInfo(
                                                      //         id: state.product_list[index].id
                                                      //             .toString(),
                                                      //         context: context,
                                                      //         title: state.product_list[index].title
                                                      //             .toString(),
                                                      //       ),
                                                      //     );
                                                      //  context.read<ProductsBloc>().add(
                                                      //   Load_SKUS(
                                                      //     id: state.product_list[index].id
                                                      //         .toString(),

                                                      //   ),
                                                      // );
                                                    },
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          decoration: const BoxDecoration(
                                                              color: ZeleexColor
                                                                  .zeleexGreen,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5))),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.22,
                                                          width:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5)),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg',
                                                                fit: BoxFit
                                                                    .contain,
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        Container(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      142,
                                                                      142,
                                                                      142),
                                                                  // height: 200,
                                                                ),
                                                                errorWidget:
                                                                    (context,
                                                                            url,
                                                                            error) =>
                                                                        Center(
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            0),
                                                                    child: Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.22,
                                                                        decoration: BoxDecoration(
                                                                            border: Border.all(
                                                                                color: const Color.fromARGB(255, 211, 204,
                                                                                    204)),
                                                                            borderRadius: const BorderRadius.all(Radius.circular(
                                                                                5))),
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            const Icon(Icons.error_outline)),
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  10, 10, 5, 0),
                                                          child: Container(
                                                            height: 42,
                                                            child: Text(
                                                              stateDatas
                                                                  .products_inStore[
                                                                      index]
                                                                  .title
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        51,
                                                                        51,
                                                                        51),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    10,
                                                                    0,
                                                                    0),
                                                            child: Text(
                                                              "฿ " +
                                                                  NumberFormat(
                                                                          "#,###,###")
                                                                      .format(int.parse(stateDatas
                                                                          .products_inStore[
                                                                              index]
                                                                          .price
                                                                          .toString())),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 17),
                                                            )),
                                                        const SizedBox(
                                                          height: 8,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                          });
                                      // return
                                      // Text(stateDatas
                                      //     .products_inStore.length
                                      //     .toString());
                                    }
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        }
      },
    );
  }
}
