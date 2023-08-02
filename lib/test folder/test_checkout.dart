import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetch_checkOut(String token) async {
  var bigdata = {};
  var toAdd_storeData = [];
  var storeData = {};
  var toAdd_cartData = [];
  var cartData = {};

  bigdata["user_address_id"] = '126';
  bigdata["temp_address_name"] = 'Chawanthon Wira';
  bigdata["temp_address_city"] = "Korat";
  bigdata["temp_address_district"] = "Mueng";
  bigdata["temp_address_province"] = 'KKU';
  bigdata["temp_address_postcode"] = '30045';
  bigdata["payment_method"] = 'internet_banking';
  bigdata["status"] = "created";

  bigdata["total_discount"] = 0;
  bigdata["total_amount"] = 30;
  bigdata["total"] = 250;
  bigdata["shipping_cost"] = 40;

  final response = await http
      .get(Uri.parse('https://admin.zeleex.com/api/cart/list'), headers: {
    'Content-Type': 'application/json',
    'Accept': 'applicationjson',
    'Authorization': 'Bearer $token',
  });
  print(response.body);

  var jsonResponse = json.decode(response.body);

  List count_Store = jsonResponse['data']['store'];

  for (var i = 0; i < count_Store.length; i++) {
    storeData = {};

    storeData["store_id"] = count_Store[i]['id'].toString();

    List count_CartinStore = jsonResponse['data']['store'][i]['product_skus'];
//!----------------------------loop cart--------------------------------- ----------------------------------
    for (var x = 0; x < count_CartinStore.length; x++) {
      cartData = {};

      toAdd_cartData = [];

      cartData["id"] = jsonResponse['data']['store'][i]['product_skus'][x]['cart_id'];

      //print(jsonResponse['data']['store'][i]['product_skus'][x]['cart_id']);

      // print('ร้านที่: ' + count_Store[i]['id'].toString() +
      //     '    รหัส: ' +
      //     count_CartinStore[x]['cart_id'].toString());

      toAdd_cartData.add(cartData);
    }

    storeData["carts"] = toAdd_cartData;
//!-------------------------------------------------------------------------------------------------
    storeData["discount_id"] = 0;
    storeData["discount"] = 0;

    storeData["total"] = count_Store[i]['price_tatal'].toString();

    storeData["total_amount"] = 1;

    storeData["shipping_id"] = count_Store[0]['shipping'][0]['id'].toString();
    ;
 
    storeData["shipping_cost"] =
        count_Store[0]['shipping'][0]['rate'][0]['price'].toString();

      

    toAdd_storeData.add(storeData);
  }

  bigdata["data"] = toAdd_storeData;

  print(jsonEncode(bigdata));

  String urlPost = "https://admin.zeleex.com/api/checkout";

  final response3 = await http.post(
    

    Uri.parse(urlPost),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token' 
    },
    body: json.encode(bigdata),
  );

  print(response3.body);
}



void main(List<String> args) {
  fetch_checkOut('1891|bw9t9hPicOAQwjdyXIRLosdUbmC0EGu4hhzuDrwU');
}




