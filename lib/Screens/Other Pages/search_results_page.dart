import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeleex_application/API/Read%20All/advance_serch_results.dart';
import 'package:zeleex_application/Others/Plate.dart';


class Search_Results_Page extends StatefulWidget {
  String keyWord = "";
  Search_Results_Page({Key? key, required this.keyWord}) : super(key: key);
  @override
  State<Search_Results_Page> createState() => _Search_Results_PageState();
}

class _Search_Results_PageState extends State<Search_Results_Page> {
  late Future<List<Data_Search_Result>> futureSearchResult;

  void initState() {
    futureSearchResult = fetch_search_results(widget.keyWord.toString());
    print(widget.keyWord.toString() + '-------------------55555555555');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            Text(
              "ผลการค้นหา",
              style: TextStyle(
                  color: ZeleexColor.zeleexGreen, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.abc_sharp,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          FutureBuilder<List<Data_Search_Result>>(
            future: futureSearchResult,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data_Search_Result>? data = snapshot.data;
                return Expanded(
                  child: RawScrollbar(
                    thumbColor: ZeleexColor.zeleexGreen,
                    radius: Radius.circular(50),
                    thickness: 5,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.6),
                      ),
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < data.length) {
                          String isNull = data[index].description.toString();
                          String animalDesc = "";
                          if (isNull == 'null') {
                            animalDesc = "- ดูรายละเอียดเพิ่มเติม -";
                          } else {
                            animalDesc = data[index].description.toString();
                          }

                          return Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: InkWell(
                                onTap: () {
                                  print(data[index].id.toString());
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           Store_Product_Detail(
                                  //         productID: data[index].id.toString(),
                                  //         productName:
                                  //             data[index].title.toString(),
                                  //       ),
                                  //     ));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
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
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                Container(
                                              color: Color.fromARGB(
                                                  255, 142, 142, 142),
                                              // height: 200,
                                            ),
                                            errorWidget:
                                                (context, url, error) => Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        3, 3, 3, 0),
                                                child: Container(
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.22,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    211,
                                                                    204,
                                                                    204)),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    alignment: Alignment.center,
                                                    child:
                                                        Icon(Icons.error_outline)),
                                              ),
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 5, 0),
                                      child: Container(
                                        height: 20,
                                        child: Text(
                                          data[index].title.toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 51, 51),
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 5, 0),
                                      child: Container(
                                        height: 33,
                                        child: Text(
                                          animalDesc.toString(),
                                          // data[index].description.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 130, 130, 130)),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //     padding: const EdgeInsets.fromLTRB(
                                    //         10, 10, 0, 0),
                                    //     child: Text(
                                    //       "฿ "
                                    //       // NumberFormat("#,###,###").format(
                                    //       //     int.parse(data[index]
                                    //       //         .price
                                    //       //         .toString())),
                                    //       ,
                                    //       style: TextStyle(color: Colors.red),
                                    //     )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
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
                return Text("${snapshot.error}");
              }
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
