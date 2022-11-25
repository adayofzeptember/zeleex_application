class AlreadyIn_Model {
  String? name;
  String? email;
  int? id;
  String? photo_url;
  String? token;

  AlreadyIn_Model({this.name, this.email, this.id, this.photo_url, this.token});
}

class AddressForCheckOut_Model {
  int? address_id;
  String? address_name;
  String? address_city;
  String? address_district;
  String? address_province;
  String? address_postcode;

  AddressForCheckOut_Model(
      {this.address_id,
      this.address_name,
      this.address_city,
      this.address_district,
      this.address_province,
      this.address_postcode});
}
