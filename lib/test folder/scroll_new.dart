import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(Check_Box());
}

class Check_Box extends StatefulWidget {
  Check_Box({Key? key}) : super(key: key);

  @override
  State<Check_Box> createState() => _Check_BoxState();
}

class _Check_BoxState extends State<Check_Box> {
  List posts = [];
  final scrollController = ScrollController();
  int page = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    fetchPOSTS();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        elevation: 0,
        
        title: Text('listview'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          controller: scrollController,
          itemCount: isLoadingMore ? posts.length + 1 : posts.length,
          itemBuilder: (context, index) {
            if (index < posts.length) {
              final post = posts[index];
              final title = post['title']['rendered'];
              return Card(
                child: ListTile(
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

  Future<void> fetchPOSTS() async {
    
    print('object');
    final url =
        'https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=15&page=${page}';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      setState(() {
        posts = posts + json;
      });
    } else {
      print('unexpected Response');
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
      await fetchPOSTS();
      setState(() {
        isLoadingMore = false;
      });
    }
  }
}
