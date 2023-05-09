class Profile_Data {
  String? id;
  String? name;
  String? image;

  Profile_Data({this.id, this.image, this.name});
}

class Address_Model {
  String? id;
  String? name;
  String? address;
  String? city;
  String? district;
  String? defaultStatus;
  String? province;
  String? postcode;
  String? phone;

  Address_Model(
      {this.address,
      this.city,
      this.district,
      this.defaultStatus,
      this.id,
      this.name,
      this.phone,
      this.postcode,
      this.province});
}
