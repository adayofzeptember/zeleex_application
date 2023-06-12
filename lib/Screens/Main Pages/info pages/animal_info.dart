// ignore_for_file: camel_case_types, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeleex_application/API/Read%20By%20ID/animal_id_API.dart';
import 'package:zeleex_application/Others/Plate.dart';
import 'package:zeleex_application/bloc/animals/animals_bloc.dart';


class Animal_Info_Page extends StatelessWidget {
  String? animalID = "";
  String? animalName = "";

  Animal_Info_Page({Key? key, this.animalID, this.animalName})
      : super(key: key);
  late Future<Animal> futureAnimalByID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalsBloc, AnimalsState>(
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
          return Scaffold(
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ZeleexColor.zeleexGreen),
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
                physics: const ClampingScrollPhysics(),
                child: Column(
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
                                fit: BoxFit.contain,
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
                                      SizedBox(
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
                                        child: const Text(
                                          "ติดตาม",
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: ZeleexColor.zeleexGreen,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )),
          );
        }
      },
    );
  }
}
