class Animals_Model {
  int? id;
  String? title;
  String? description;
  String? price;
  String? image;

  Animals_Model(
      {this.id, this.description, this.price, this.title, this.image});
}

class Animal_Info {
  int? id;
  List? image;
  String? title;
  int? price;
  String? description;
  String? store_title;
  String? store_address;
  String? store_phone;
  String? store_id;
  String? store_img;

  Animal_Info(
      {this.id,
      this.description,
      this.price,
      this.image,
      this.store_img,
      this.store_address,
      this.store_phone,
      this.title,
      this.store_id,
      this.store_title});
}
