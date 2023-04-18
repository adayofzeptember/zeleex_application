class AllStores_Model {
  int? id;
  String? title;
  String? address;
  String? image;

  AllStores_Model({
    this.id,
    this.title,
    this.address,
    this.image,
  });
}

class StoreInfo_Model {
  int? id;
  String? title;
  String? address;
  String? phone;
  String? content;
  String? image;
  List? types;

  StoreInfo_Model(
      {this.id,
      this.title,
      this.address,
      this.phone,
      this.content,
      this.types,
      this.image});
}
