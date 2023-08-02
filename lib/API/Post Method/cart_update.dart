import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cart_Update {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Cart_Update(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Cart_Update.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  int? userId;
  int? storeId;
  int? productSkuId;
  String? unit;

  Data(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.storeId,
      this.productSkuId,
      this.unit});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    userId = json['user_id'];
    storeId = json['store_id'];
    productSkuId = json['product_sku_id'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['product_sku_id'] = this.productSkuId;
    data['unit'] = this.unit;
    return data;
  }
}

class Provider_CartUpdate {
  String? cart_id;
  String? prd_unit;

  Provider_CartUpdate({this.cart_id, this.prd_unit});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.cart_id;
    data['unit'] = this.prd_unit;
    return data;
  }
}

Future<Cart_Update> update_cartUnit(
    Provider_CartUpdate provider_cartUpdate, String userToken) async {
  String urlPost = "https://api.zeleex.com/api/cart/update";
  var body_UpdateCart = json.encode(provider_cartUpdate.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    },
    body: body_UpdateCart,
  );
  if (response.statusCode == 400 ||
      response.statusCode >= 200 && response.statusCode <= 299) {
   
    print('update success');
    return Cart_Update.fromJson(json.decode(response.body));
  } else {
    throw Exception("error");
  }
}
