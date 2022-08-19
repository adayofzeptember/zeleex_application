import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

import 'API/Read All/blogs_readall_api.dart';
import 'API/Read By ID/blog_id_api.dart';
import 'Plate.dart';
import 'main 6 pages/newsfeed.dart';
import 'package:http/http.dart' as http;

class NewsFeedPage_Detail extends StatefulWidget {
  String blogID = "";
  NewsFeedPage_Detail({Key? key, required this.blogID}) : super(key: key);
  @override
  State<NewsFeedPage_Detail> createState() => _NewsFeedPage_Detail();
}

class _NewsFeedPage_Detail extends State<NewsFeedPage_Detail> {
  Future<Blog> fetchBlog_ByID() async {
    var url = "https://api.zeleex.com/api/blogs/" + widget.blogID;
    var response = await http.get(Uri.parse(url));
    var jsonResponse = json.decode(response.body);
    var jsonCon = jsonResponse['data']['blog'];
    Blog msg = Blog.fromJson(jsonCon);
    return msg;
  }

  late Future<Blog> future_BlogID;

  @override
  void initState() {
    future_BlogID = fetchBlog_ByID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              Text(
                "นิวส์ฟีด",
                style: TextStyle(
                    color: Palette.kToDark, fontWeight: FontWeight.bold),
              ),
              Text("")
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: future_BlogID,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      Blog blog = snapshot.data;
                      String blogContent = blog.content.toString();
                      String get_Thetime = blog.createdAt.toString();
                      var createdTime = DateFormat.yMMMd()
                          .format(DateTime.parse(get_Thetime));

                      var document555;
                      if (blogContent == 'null') {
                        document555 = parse('<p>ไม่มีเนื้อหาของข่าวสาร</p>');
                        ;
                      } else {
                        document555 = parse(blogContent);
                      }
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                              child: Row(children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: Text(
                                    blog.title.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 51, 51, 51)),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Divider(
                                  color: Color.fromARGB(255, 165, 162, 162)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    createdTime,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 165, 162, 162)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/Share.svg',
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/Like.svg',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CachedNetworkImage(
                              imageUrl: blog.image!.main.toString(),
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Container(
                                color: Color.fromARGB(255, 142, 142, 142),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                              ),
                              errorWidget: (context, url, error) => Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
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
                                                child: Text(
                                                    "ไม่พบรูปภาพของข่าวสารนี้"))),
                                      )),
                                ),
                              ),
                            ),

                        
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(checkContent),
                                  Center(
                                      child: HtmlWidget(document555.outerHtml)),
                                  //Text(blogContent),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
