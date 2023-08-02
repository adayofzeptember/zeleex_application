import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Store_Subscribe {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Store_Subscribe(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Store_Subscribe.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
    data['sessionID'] = this.sessionID;
    data['serverDateTimeMS'] = this.serverDateTimeMS;
    data['serverDatetime'] = this.serverDatetime;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? hasSubscribed;

  Data({this.hasSubscribed});

  Data.fromJson(Map<String, dynamic> json) {
    hasSubscribed = json['hasSubscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasSubscribed'] = this.hasSubscribed;
    return data;
  }
}

class Store_Subscribe_Model {
  String? user_id;
  String? store_id;

  Store_Subscribe_Model({
    this.user_id,
    this.store_id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['store_id'] = this.store_id;

    return data;
  }
}

Future<Store_Subscribe> user_store_subscribe(
    Store_Subscribe_Model subsModel, String token) async {
  String urlPost = "https://api.zeleex.com/api/store/user/subscribe";
  var body_storesub = json.encode(subsModel.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: body_storesub,
  );

  print(json.decode(response.body.toString()));


  if (response.statusCode == 400 || response.statusCode == 200) {
    return Store_Subscribe.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
