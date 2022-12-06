import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '../API/Read All/stores_API.dart';
import '../Plate.dart';

void main(List<String> args) {
  runApp(Fix_InfinityLoad());
}

class Fix_InfinityLoad extends StatefulWidget {
  Fix_InfinityLoad({Key? key}) : super(key: key);

  @override
  State<Fix_InfinityLoad> createState() => _Fix_InfinityLoadState();
}

class _Fix_InfinityLoadState extends State<Fix_InfinityLoad> {
  List data = [];
  final scrollController = ScrollController();
  int page = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    fetch_StorePage_readAll();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
           appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
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
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Visibility(
                visible: false,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text("ร้านค้า",
                  style: TextStyle(
                      color: Palette.kToDark, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                child: SvgPicture.asset(
                  'assets/images/sort.svg',
                ),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),

            ),
          ),
        ],
      ),
      body: 
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          controller: scrollController,
          itemCount: isLoadingMore ? data.length + 1 : data.length,
          itemBuilder: (context, index) {
            if (index < data.length) {
              final post = data[index];
              //final stoer_id = post
              final title = post['title'];
              return InkWell(
                onTap: () {
                  print(post['id']);
                },
                child: Card(
                  child: ListTile(
                  
                    title: Text(title),
                    leading: CircleAvatar(child: Text('${index + 1}')),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }

  Future<void> fetch_StorePage_readAll() async {
    final response = await http.get(
      Uri.parse('https://admin.zeleex.com/api/animals?per_page=15&page=${page}'),
      headers: {'Accept': 'application/json'},
    );
    var jsonResponse = json.decode(response.body);
    final jsonCon = jsonResponse['data']['data'] as List;
    if (response.statusCode == 200) {
      setState(() {
        data = data + jsonCon;
      });
      //print(data[1]['title']);
    } else {
      throw Exception("error...");
    }
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      page = page + 1;

      await fetch_StorePage_readAll();
      setState(() {
        isLoadingMore = false;
      });
    }
  }
}
