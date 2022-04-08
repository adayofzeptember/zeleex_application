import 'dart:convert';

import 'package:http/http.dart' as Http;

class MessageTell {
  String status = "";
  String mess = "";

  MessageTell({required this.status, required this.mess});

  MessageTell.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mess = json['responseStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseStatus'] = this.mess;
    return data;
  }
}

class DogService {
  // static randomDog() {
  //   var url = "https://dog.ceo/api/breeds/image/random";
  //   Http.get(Uri.parse(url)).then((res) {
  //     print(res.body);
  //   });
  // }
  static Future<MessageTell> randomDog() async {
    var url = "https://sanboxapi.zeleex.com/api/animals/4";
    var response = await Http.get(Uri.parse(url));
    MessageTell msg = MessageTell.fromJson(json.decode(response.body));
    //print(msg.mess);
    //print(msg.status);
    return msg;
  }
}
