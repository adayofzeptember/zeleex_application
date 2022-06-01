class ResponseModel {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? phone;
  Null? avatar;
  Null? provider;
  Null? providerId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? imageProfile;
  int? storeCheck;
  //String? error;

  ResponseModel({
    // this.id,
    // this.name,
    this.email,
    //this.error
    // this.emailVerifiedAt,
    // this.phone,
    // this.avatar,
    // this.provider,
    // this.providerId,
    // this.status,
    // this.createdAt,
    // this.updatedAt,
    // this.token,
    // this.imageProfile,
    // this.storeCheck
  });
  
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      // id: json["id"] != null ? json["id"] : "",
      // name: json["name"] != null ? json["name"] : "",
      email: json["email"] != null ? json["email"] : "",
      //error: json["error"] != null ? json["error"] : "",
    );
  }
}