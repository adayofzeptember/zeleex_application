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

class EditAddress_Model {
  String? id;
  String? name;
  String? address;
  String? city;
  String? district;
  bool? defaultStatus;
  String? province;
  String? postcode;
  String? phone;

  EditAddress_Model(
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



class NewAddress_Request {
  String? address;
  String? city;
  String? district;
  String? province;
  String? postcode;
  String? defaultt;
  String? name;
  String? phone;

  NewAddress_Request(
      {this.address,
      this.city,
      this.district,
      this.province,
      this.postcode,
      this.defaultt,
      this.name,
      this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['province'] = this.province;
    data['postcode'] = this.postcode;
    data['default'] = this.defaultt;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

