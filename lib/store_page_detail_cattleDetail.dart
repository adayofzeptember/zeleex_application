import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:zeleex_application/API/Read%20By%20ID/animal_id_API.dart';
import 'package:zeleex_application/API/model.dart';
import 'package:zeleex_application/main%206%20pages/animal.dart';
import 'Plate.dart';
import 'store_page_detail_cattle.dart';
import 'package:http/http.dart' as http;

class Store_Cattle_Detail extends StatefulWidget {
  String? animalID = "";
  String? animalName = "";
  late AlreadyIn_Model modd;

  Store_Cattle_Detail({Key? key, this.animalID, this.animalName})
      : super(key: key);

  @override
  State<Store_Cattle_Detail> createState() => _Store_Cattle_DetailState();
}

class _Store_Cattle_DetailState extends State<Store_Cattle_Detail> {
   late Future<Animal> futureAnimalByID;

  @override
  void initState() {
    futureAnimalByID = fetch_Animal_ByID();
    super.initState();
  }

  Future<Animal> fetch_Animal_ByID() async {
    var url =
        "https://api.zeleex.com/api/animals/" + widget.animalID.toString();
    var response = await http.get(Uri.parse(url), headers: {
      //'Accept: application/json'

      'Content-Type': 'application/json',
      'Charset': 'utf-8'
    });
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
                        "???????????????????????????????????????",
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
                    Text("???????????????????????????????????????????????????")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
                      color: Palette.kToDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
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
              future: futureAnimalByID,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  Animal thisAnimal = snapshot.data;
                  // String getContent = thisAnimal.content.toString();
                  // var document555 = parse(getContent);

                  return Column(
                    //! container ???????????? column
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: thisAnimal.image!.main.toString(),
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                          color: Color.fromARGB(255, 142, 142, 142),
                          height: MediaQuery.of(context).size.height * 0.3,
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      width: double.infinity,
                                      height: 300,
                                      child: Center(
                                          child: Text("?????????????????????????????????????????????????????????"))),
                                )),
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
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
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
                                      "??? " +
                                          NumberFormat("#,###,###").format(
                                              int.parse(
                                                  thisAnimal.price.toString())),
                                      style: TextStyle(
                                          color: Colors.red[400], fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "??? " +
                                          NumberFormat("#,###,###").format(
                                              int.parse(
                                                  thisAnimal.price.toString())),
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
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
                                          child: Text(
                                            pressed ? "??????????????????" : "??????????????????????????????",
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
                        height: 3,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                            child: ExpandableNotifier(
                                child: Column(
                              children: <Widget>[
                                ScrollOnExpand(
                                  scrollOnExpand: true,
                                  scrollOnCollapse: false,
                                  child: ExpandablePanel(
                                    theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: false,
                                    ),
                                    header: Text(
                                      "????????????????????????????????????????????????",
                                      style: TextStyle(
                                          color: Palette.kToDark, fontSize: 20),
                                    ),
                                    collapsed: Container(),
                                    expanded: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20,
                                        ),
                                        // HtmlWidget(document555.outerHtml),
                                        Text(
                                          thisAnimal.description.toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 130, 130, 130)),
                                        ),
                                        SizedBox(
                                          height: 80,
                                        ),
                                      ],
                                    ),
                                    builder: (_, collapsed, expanded) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 0, right: 0, bottom: 10),
                                        child: Expandable(
                                          collapsed: collapsed,
                                          expanded: expanded,
                                          theme: const ExpandableThemeData(
                                              crossFadePoint: 0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ))),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              }),
        ],
      )),
    );
  }
}
