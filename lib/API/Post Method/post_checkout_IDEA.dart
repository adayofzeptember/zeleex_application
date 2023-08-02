import 'dart:convert';


void postCart() {
  var bigdata = {};
  var toAddData = [];
  var internalData = {};

  var cart_toAddData = [];
  var cart_internalData = {};

  bigdata["user_address_id"] = 1;
  bigdata["temp_address_name"] = 'Chawanthon Wira';
  bigdata["temp_address_city"] = "Korat";
  bigdata["temp_address_district"] = "Mueng";
  bigdata["temp_address_province"] = 'KKU';
  bigdata["payment_method"] = 'plai-tang';
  bigdata["temp_address_postcode"] = '30045';
  bigdata["status"] = 'created';
  bigdata["total_discount"] = 0;
  bigdata["total_amount"] = 9;
  bigdata["total"] = 250;
  bigdata["shipping_cost"] = 40;

  for (int i = 0; i < 3; i++) { //ลูปใหญ่
    internalData = {};

    internalData["store_id"] = i;

    for (var ix = 0; ix < 1; ix++) {
      cart_internalData = {};
      if (ix < i) {
        break;
      } else {
        cart_internalData["id"] = ix;
      }

      cart_toAddData.add(cart_internalData);
    }
    internalData["carts"] = cart_toAddData;
  

    internalData["discount_id"] = 5;
    internalData["discount"] = 5;
    internalData["total"] = 5;
    internalData["total_amount"] = 5;
    internalData["shipping_id"] = 5;
    internalData["shipping_cost"] = 5;
    toAddData.add(internalData);
  }

  bigdata["data"] = toAddData;

  print(jsonEncode(bigdata));
}

