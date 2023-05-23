import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../Others/Plate.dart';
import '../bloc/news_feed/news_feed_bloc.dart';

class NewsFeedPage_Detail extends StatelessWidget {
  NewsFeedPage_Detail({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsFeedBloc, NewsFeedState>(
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
                  style: TextStyle(
                      fontSize: 25,
                      color: ZeleexColor.zeleexGreen,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ));
        } else {
          var createdTime = DateFormat.yMMMd()
              .format(DateTime.parse(state.news_info.dateCreated));
          var parsedHTMLContent;
          if (state.news_info.content == 'null') {
            parsedHTMLContent = parse('<p>ไม่มีเนื้อหาของข่าวสาร</p>');
            ;
          } else {
            parsedHTMLContent = parse(state.news_info.content);
          }

          return Scaffold(
              backgroundColor: Colors.white,
              // backgroundColor: Color.fromARGB(255, 242, 242, 242),
              appBar: AppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                    statusBarColor: Colors.white,
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    " ",
                    style: TextStyle(
                        color: ZeleexColor.zeleexGreen,
                        fontWeight: FontWeight.bold),
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
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                          child: Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Text(
                                state.news_info.title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 51, 51, 51)),
                              ),
                            ),
                          ]),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Divider(
                              color: Color.fromARGB(255, 165, 162, 162)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                createdTime,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 165, 162, 162)),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     SvgPicture.asset(
                              //       'assets/images/Share.svg',
                              //     ),
                              //     SvgPicture.asset(
                              //       'assets/images/Like.svg',
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CachedNetworkImage(
                          imageUrl: state.news_info.image.toString(),
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Container(
                            color: const Color.fromARGB(255, 142, 142, 142),
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          errorWidget: (context, url, error) => Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: Center(
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 141, 141, 141))),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                        width: double.infinity,
                                        height: 300,
                                        child: const Center(
                                            child: Text(
                                                "ไม่พบรูปภาพของข่าวสารนี้"))),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child:
                                      HtmlWidget(parsedHTMLContent.outerHtml)),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )));
        }
      },
    );
  }
}
