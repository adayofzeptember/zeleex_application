import 'dart:convert';
import 'package:http/http.dart' as Http;

class MessageTell {
  String statusCode = " ";
  String mess = " ";
  String timeStamp = " ";

  MessageTell({required this.statusCode, required this.mess, required this.timeStamp});

  MessageTell.fromJson(Map<String, dynamic> json) {
    statusCode = json['responseCode'];
    mess = json['responseMessage'];
    timeStamp = json['serverDatetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.statusCode;
    data['responseMessage'] = mess;
    data['serverDatetime'] = this.timeStamp;
    return data;
  }
}

class DogService {
  static Future<MessageTell> randomDog() async {
    var url = "https://sanboxapi.zeleex.com/api/animals/4";
    var response = await Http.get(Uri.parse(url));
    MessageTell msg = MessageTell.fromJson(json.decode(response.body));
    //print(msg.mess);
    //print(msg.status);
    return msg;
  }
}
