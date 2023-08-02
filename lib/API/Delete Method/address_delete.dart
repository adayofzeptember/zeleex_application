import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Address_Delete_Response {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data_Address_Delete? data;

  Address_Delete_Response(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Address_Delete_Response.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null
        ? new Data_Address_Delete.fromJson(json['data'])
        : null;
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

class Data_Address_Delete {
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
  String? deletedAt;

  Data_Address_Delete(
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

  Data_Address_Delete.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    district = json['district'];
    province = json['province'];
    postcode = json['postcode'];
    phone = json['phone'];
    default1 = json['default1'];
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
    data['default1'] = this.default1;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

Future<Address_Delete_Response> address_remove_function(
    String address_id, String token) async {
  String urlDelete = "https://api.zeleex.com/api/address/shipping-delete/" +
      address_id.toString();

  final response = await http.delete(
    Uri.parse(urlDelete),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print("remove success");
    return Address_Delete_Response.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
