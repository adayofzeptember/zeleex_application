class Products_Model {
  int? id;
  String? title;
  String? price;
  String? image;

  Products_Model({this.id, this.price, this.title, this.image});
}

class Product_Info {
  int? id;
  String? title;
  int? price;
  String? images;
  String? store_id;
  String? store_title;
  String? store_img;
  String? store_description;
  String? store_address;
  String? store_phone;
  List? skus;

  Product_Info(
      {this.id,
      this.store_description,
      this.price,
      this.images,
      this.store_img,
      this.skus,
      this.store_address,
      this.store_phone,
      this.title,
      this.store_id,
      this.store_title});
}
