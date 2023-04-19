import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeleex_application/API/Read%20By%20ID/animal_id_API.dart';
import 'package:zeleex_application/bloc/animals/animals_bloc.dart';
import '../Others/Plate.dart';

class Animal_Info_Page extends StatelessWidget {
  String? animalID = "";
  String? animalName = "";

  Animal_Info_Page({Key? key, this.animalID, this.animalName})
      : super(key: key);
  late Future<Animal> futureAnimalByID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         width: 150,
      //         child: FloatingActionButton(
      //           heroTag: "btn1",
      //           backgroundColor: ZeleexColor.zeleexGreen,
      //           shape: const BeveledRectangleBorder(
      //               borderRadius: BorderRadius.zero),
      //           onPressed: () => {
      //             launch("tel://${1}"),
      //           },
      //           child: Container(
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SvgPicture.asset(
      //                   'assets/images/call.svg',
      //                   color: Colors.white,
      //                 ),
      //                 const SizedBox(
      //                   width: 5,
      //                 ),
      //                 const Text(
      //                   "ติดต่อร้านค้า",
      //                   style: TextStyle(color: Colors.white),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
            animalName.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: ZeleexColor.zeleexGreen),
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
          physics: ClampingScrollPhysics(),
          child: BlocBuilder<AnimalsBloc, AnimalsState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: JumpingText(
                        'กำลังโหลด...',
                        style: TextStyle(
                            fontSize: 25, color: ZeleexColor.zeleexGreen),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: <Widget>[
                    CarouselSlider.builder(
                        itemCount: state.animal_info.image.length,
                        itemBuilder: (BuildContext, index, realIndex) {
                          return Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(167, 216, 216, 216)),
                              child: Image.network(
                                state.animal_info.image[index].toString(),
                                fit: BoxFit.cover,
                              ));
                        },
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration: const Duration(seconds: 2),
                            // onPageChanged: (index, reason) => setState(
                            //       (() => activeIndex = index),
                            //     )
                                )),

                    // CachedNetworkImage(
                    //   imageUrl: state.animal_info.image.toString(),
                    //   fit: BoxFit.cover,
                    //   progressIndicatorBuilder:
                    //       (context, url, downloadProgress) => Container(
                    //     color: Color.fromARGB(255, 142, 142, 142),
                    //     height: MediaQuery.of(context).size.height * 0.3,
                    //   ),
                    //   errorWidget: (context, url, error) => Padding(
                    //     padding: const EdgeInsets.only(right: 5, left: 5),
                    //     child: Center(
                    //       child: Container(
                    //           decoration: BoxDecoration(
                    //               border: Border.all(
                    //                   color:
                    //                       Color.fromARGB(255, 141, 141, 141))),
                    //           alignment: Alignment.center,
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(top: 10),
                    //             child: Container(
                    //                 width: double.infinity,
                    //                 height: 300,
                    //                 child: Center(
                    //                     child: Text("ไม่พบรูปภาพของสัตว์"))),
                    //           )),
                    //     ),
                    //   ),
                    // ),
                    // // buildIndcator(),

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
                                    state.animal_info.title.toString(),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 51, 51, 51),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SvgPicture.asset('assets/images/love.svg')
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "฿ " +
                                        NumberFormat("#,###,###").format(
                                            int.parse(state.animal_info.price
                                                .toString())),
                                    style: TextStyle(
                                        color: Colors.red[400], fontSize: 17),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // SvgPicture.asset('assets/images/groupStar.svg'),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                            ],
                          )),
                    ),

                    const SizedBox(
                      height: 3,
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
                                    state.animal_info.store_img.toString()),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.animal_info.store_title.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/pincat.svg',
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: Text(
                                          state.animal_info.store_address
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.grey),
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
                                          const SizedBox(width: 10),
                                          Text(
                                            state.animal_info.store_phone
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
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
                                            primary: ZeleexColor.zeleexGreen,
                                            elevation: 0),
                                        onPressed: () {
                                          // request_model_store_subscribe
                                          //     .user_id = user_id.toString();

                                          // request_model_store_subscribe
                                          //         .store_id =
                                          //     thisAnimal.storeId.toString();

                                          // user_store_subscribe(
                                          //     request_model_store_subscribe,
                                          //     user_token);
                                          // setState(() {
                                          //   pressed = !pressed;
                                          // });
                                        },
                                        child: Text(
                                          "ติดตาม",
                                          style: const TextStyle(
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
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "รายละเอียด",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                    color: ZeleexColor.zeleexGreen,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.animal_info.description.toString(),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 130, 130, 130)),
                              ),
                            ],
                          )),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: ZeleexColor.zeleexGreen,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                            launch("tel://${state.animal_info.store_phone}");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/call.svg',
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "ติดต่อร้านค้า",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              }
            },
          )),
    );
  }
}
