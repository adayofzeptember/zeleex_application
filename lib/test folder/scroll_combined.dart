import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../API/Read All/stores_API.dart';

void main(List<String> args) {
  runApp(Check_Box());
}

class Check_Box extends StatefulWidget {
  Check_Box({Key? key}) : super(key: key);

  @override
  State<Check_Box> createState() => _Check_BoxState();
}

class _Check_BoxState extends State<Check_Box> {
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
        title: Text('---'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          controller: scrollController,
          itemCount: isLoadingMore ? data.length + 1 : data.length,
          itemBuilder: (context, index) {
            if (index < data.length) {
              final post = data[index];
              final title = post['title'];
              return Card(
                child: ListTile(
                  title: Text(title),
                  leading: CircleAvatar(child: Text('${index + 1}')),
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

  // Future<void> fetchPOSTS() async {
  //   final url =
  //       'https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=15&page=${page}';

  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body) as List;
  //     setState(() {
  //       posts = posts + json;
  //     });
  //   } else {
  //     print('unexpected Response');
  //   }
  // }

  Future<void> fetch_StorePage_readAll() async {
    final response = await http.get(
      Uri.parse('https://admin.zeleex.com/api/stores?per_page=15&page=${page}'),
      headers: {'Accept': 'application/json'},
    );
    var jsonResponse = json.decode(response.body);
    final jsonCon = jsonResponse['data']['data'] as List;
    if (response.statusCode == 200) {
      print('----------');
      setState(() {
        data = data + jsonCon;
      });
      print(data[1]['title']);
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
