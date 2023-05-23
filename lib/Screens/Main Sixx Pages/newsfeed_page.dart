import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:zeleex_application/bloc/news_feed/news_feed_bloc.dart';
import '../../Others/Plate.dart';
// ignore_for_file: type=lint
class NewsFeedPage extends StatefulWidget {
  NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  ScrollController scController = ScrollController();

  void initState() {
    context.read<NewsFeedBloc>().add(Load_NewsFeed());
    scController.addListener(() {
      if (scController.position.pixels ==
          scController.position.maxScrollExtent) {
        context.read<NewsFeedBloc>().add(Load_NewsFeed());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark),
          leading: Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                child: Visibility(
                  visible: false,
                  child: SvgPicture.asset(
                    'assets/images/menu.svg',
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "ข่าวสาร",
            style: TextStyle(
                color: ZeleexColor.zeleexGreen, fontWeight: FontWeight.bold),
          )),
      body: BlocBuilder<NewsFeedBloc, NewsFeedState>(
        builder: (context, state) {
          return Scrollbar(
            thickness: 8,
            radius: const Radius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                key: const PageStorageKey<String>('feedpage'),
                shrinkWrap: true,
                controller: scController,
                itemCount: (state.isLoading == true)
                    ? state.newsfeed_data.length + 1
                    : state.newsfeed_data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == state.newsfeed_data.length &&
                      state.isLoading == true) {
                    return const Padding(
                      padding: EdgeInsets.all(75.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ZeleexColor.zeleexGreen,
                        ),
                        //const CupertinoActivityIndicator()
                      ),
                    );
                  }
                  var createdTime = DateFormat.yMMMd().format(
                      DateTime.parse(state.newsfeed_data[index].dateCreated));
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => NewsFeedPage_Detail()));
                        context.read<NewsFeedBloc>().add(
                              Blog_Detail(
                                id: state.newsfeed_data[index].id.toString(),
                                context: context,
                              ),
                            );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: state.newsfeed_data[index].image
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 141, 141, 141),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const CircleAvatar(
                                      child: Icon(
                                        Icons.person,
                                        color: ZeleexColor.zeleexGreen,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 224, 224, 224),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            state.newsfeed_data[index].title
                                                .toString(),
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 51, 51, 51),
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          createdTime.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 165, 162, 162)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl:
                                    state.newsfeed_data[index].image.toString(),
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        Container(
                                  color:
                                      const Color.fromARGB(255, 142, 142, 142),
                                  height: 200,
                                ),
                                errorWidget: (context, url, error) => Padding(
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
                                  child: Center(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 141, 141, 141))),
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        child:
                                            const Text("ไม่พบรูปภาพของบล็อก")),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.newsfeed_data[index].title.toString(),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 51, 51, 51),
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Container(
                                  //     child: Row(
                                  //   children: [
                                  //     SvgPicture.asset(
                                  //       'assets/images/sharefeed.svg',
                                  //     ),
                                  //   ],
                                  // ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                state.newsfeed_data[index].description
                                    .toString(),
                                // "แต่ถ้าเลี้ยงแบบครบวงจร ภาครัฐจัดหาน้ำเชื้อจากพ่อแม่พันธุ์ชั้นดีเกษตรกรนำมาผสมพันธุ์ แล้วเลี้ยงอนุบาลส่งต่อให้เกษตรกรที่พอมีกำลังทรัพย์นำมาขุนต่อด้วยเทคโนโลยีสมัยใหม่ ให้ ได้เนื้อวัวเกรดพรีเมียมมีไขมันแทรก ไม่ต่างจากเนื้อจากต่างประเทศราคาแพง",
                                style: const TextStyle(
                                  fontFamily: 'Kanit',
                                  color: Color.fromARGB(255, 130, 130, 130),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
