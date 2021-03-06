import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeleex_application/API/Read%20All/stores_API.dart';
import 'package:zeleex_application/Plate.dart';
import 'package:zeleex_application/store_page_detail.dart';

class Store_Filtered extends StatefulWidget {
  String? typeID = "";
  Store_Filtered({Key? key, this.typeID}) : super(key: key);

  @override
  State<Store_Filtered> createState() => _Store_FilteredState();
}

class _Store_FilteredState extends State<Store_Filtered> {
  final controller = ScrollController();


  late Future<List<Data_Store_ReadALL>> _futureStoreFiltered;
  Future<List<Data_Store_ReadALL>> fetch_StorePage_readAll() async {
    final response = await http.get(
      Uri.parse('https://api.zeleex.com/api/stores?type_id='+widget.typeID.toString()),
      headers: {'Accept': 'application/json'},
    );

   
    var jsonResponse = json.decode(response.body);
    List jsonCon = jsonResponse['data']['data'];
    if (response.statusCode == 200) {
      return jsonCon.map((data) => Data_Store_ReadALL.fromJson(data)).toList();
    } else {
      throw Exception("error...");
    }
  }

  void initState() {
    _futureStoreFiltered = fetch_StorePage_readAll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.kToDark,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Palette.kToDark,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        title: Text("ผลการค้นหาสำหรับ...", style: TextStyle(fontSize: 18)),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          FutureBuilder<List<Data_Store_ReadALL>>(
            future: _futureStoreFiltered,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data_Store_ReadALL>? data = snapshot.data;
                return Expanded(
                  child: RawScrollbar(
                    controller: controller,
                    thumbColor: Palette.kToDark,
                    radius: Radius.circular(50),
                    thickness: 5,
                    child: GridView.builder(
                      controller: controller,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: MediaQuery.of(context).size.width /
                        //     (MediaQuery.of(context).size.height / 1.55),
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.36,
                      ),
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < data.length) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Store_Detail(
                                            storeID: data[index].id.toString(),
                                            storeName:
                                                data[index].title.toString(),
                                          )),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.21,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: CachedNetworkImage(
                                        imageUrl: data[index]
                                            .image!
                                            .thumbnail
                                            .toString(),
                                        fit: BoxFit.fill,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Container(
                                          color: Color.fromARGB(
                                              255, 142, 142, 142),
                                          // height: 200,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                          child: Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  3, 3, 3, 0),
                                              child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.22,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              255, 255, 255, 255)),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(5))),
                                                  alignment: Alignment.center,
                                                  child: Image.network("https://mpng.subpng.com/20180502/qgq/kisspng-computer-icons-online-shopping-e-commerce-retail-store-icon-5aea5af37f4476.4302633215253081475213.jpg"))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                    child: Text(
                                      data[index].title.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 10, 10, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: SvgPicture.asset(
                                              'assets/images/pinstore.svg'),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 120,
                                          child: Text(
                                            data[index].address.toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Palette.kToDark),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/star.svg'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("5.0")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          // return Container();

                          return Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                        "ไม่สามารถโหลดข้อมูลได้ โปรดตรวจสอบการเชื่อมต่อ" +
                            snapshot.error.toString()));
              }
              // By default show a loading spinner.
              return Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                    child: Center(child: CircularProgressIndicator())),
              );
            },
          ),
        ],
      ),
    );
  }
}
