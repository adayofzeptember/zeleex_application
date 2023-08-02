import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShippingAddress_forEditing {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data_Address? data;

  ShippingAddress_forEditing(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  ShippingAddress_forEditing.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data =
        json['data'] != null ? new Data_Address.fromJson(json['data']) : null;
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

class Data_Address {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? city;
  String? district;
  String? province;
  String? postcode;
  String? phone;
  int? default1;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  Data_Address(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.city,
      this.district,
      this.province,
      this.postcode,
      this.phone,
      this.default1,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data_Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    district = json['district'];
    province = json['province'];
    postcode = json['postcode'];
    phone = json['phone'];
    default1 = json['default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    data['phone'] = this.phone;
    data['default'] = this.default1;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

Future<Data_Address> fetch_address_forEditOnly(
    int address_id, String userToken) async {
  var url = "https://api.zeleex.com/api/address/shipping-edit/" +
      address_id.toString();
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Charset': 'utf-8',
    'Authorization': 'Bearer $userToken',
  });

  var jsonResponse = json.decode(response.body);
  var jsonCon = jsonResponse['data'];
  Data_Address addressDetail = Data_Address.fromJson(jsonCon);
  print(addressDetail.id);
  print(addressDetail.name);
  return addressDetail;
}
