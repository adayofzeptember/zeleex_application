import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


//-------------------------------------------------------------------------------------------------------------------

class AddToCart_Request {
  int? user_id;
  int? store_id;
  int? product_sku_id;
  int? unit;

  AddToCart_Request(
      {this.user_id, this.store_id, this.product_sku_id, this.unit});

  Map<String, dynamic> toJson() {
    
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['store_id'] = this.store_id;
    data['product_sku_id'] = this.product_sku_id;
    data['unit'] = this.unit;
    return data;
  }
}

Future<void> add_to_cart_now(
    AddToCart_Request request_cartAdd, String userToken) async {
  String urlPost = "https://api.zeleex.com/api/cart/add";
  var bodyAddCart = json.encode(request_cartAdd.toJson());
  final response = await http.post(
    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    },
    body: bodyAddCart,
  );

  if (response.statusCode == 400 ||
      response.statusCode >= 200 && response.statusCode <= 299) {
    print(response.body.toString());

  } else {
    throw Exception("error");
  }
}


