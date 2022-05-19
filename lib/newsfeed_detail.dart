import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/images/cart123.svg',
                    ),
                  ],
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: fetchBlog_ByID(widget.blogID),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      Blog blog = snapshot.data;
                      return Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                              child: Row(
                                children: [
                                  Text(
                                    blog.title.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 51, 51, 51)),
                                  ),
                                ]
                              ),
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
                                    blog.updatedAt.toString(),
                                    style: TextStyle(
                                        fontSize: 10,
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
                            // Image.asset('assets/images/cows1.png'),
                            Image.network(
                              blog.image!.main.toString(),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    blog.seoDescription.toString(),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child:
                                        Image.asset('assets/images/cows2.png'),
                                  ),
                                  Text(
                                    blog.content.toString(),
                                  ),
                                  Image.asset('assets/images/man.png'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    blog.seoTitle.toString(),
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } 
                    else {
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
