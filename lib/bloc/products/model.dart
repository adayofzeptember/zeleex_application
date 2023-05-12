class Products_Model {
  int? id;
  String? title;
  String? price;
  String? image;

  Products_Model({this.id, this.price, this.title, this.image});
}

class Product_Info {
  String? id;
  String? title;
  String? price;
  String? images;
  String? store_id;
  String? store_title;
  String? store_img;
  String? store_description;
  String? store_address;
  String? store_phone;

  Product_Info(
      {this.id,
      this.store_description,
      this.price,
      this.images,
      this.store_img,
      this.store_address,
      this.store_phone,
      this.title,
      this.store_id,
      this.store_title});
}

class Product_Skus_List {
  String? sku_id;
  String? sku_name;
  // String? images;
  String? sku_price;
  String? sku_stock;

  Product_Skus_List({
    this.sku_id,
    this.sku_name,
    this.sku_price,
    this.sku_stock,
  });
}
