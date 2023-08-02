
class Register {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  String? serverDatetimwerwefe;
  Responese_register? data;

  Register(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.serverDatetimwerwefe,
      this.data});

  Register.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null
        ? new Responese_register.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
    data['sessionID'] = this.sessionID;
    data['serverDateTimeMS'] = this.serverDateTimeMS;
    data['serverDatetime'] = this.serverDatetime;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Responese_register {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;
  String? imageProfile;
  int? storeCheck;

  Responese_register(
      {this.name,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.token,
      this.imageProfile,
      this.storeCheck});

  Responese_register.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
    imageProfile = json['image_profile'];
    storeCheck = json['store_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['token'] = this.token;
    data['image_profile'] = this.imageProfile;
    data['store_check'] = this.storeCheck;
    return data;
  }
}

class Register_Model {
  String? name;
  String? email;
  String? password;
  String? password_confirmation;
  String? policy_confirmation;

  Register_Model(
      {this.name,
      this.email,
      this.password,
      this.password_confirmation,
      this.policy_confirmation});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.password_confirmation;
    data['policy_confirmation'] = this.policy_confirmation;
    return data;
  }
}


