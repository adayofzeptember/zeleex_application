import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zeleex_application/main_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

void getData() {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void getData() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
   
    http.Response response =  await http.get(url);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container();
  }
}
