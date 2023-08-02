import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Review_Product {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Review_Product(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Review_Product.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    sessionID = json['sessionID'];
    serverDateTimeMS = json['serverDateTimeMS'];
    serverDatetime = json['serverDatetime'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? currentPage;
  List<Data_Review>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null nextPageUrl;
  String? path;
  int? perPage;
  Null prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

      

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data_Review>[];
      json['data'].forEach((v) {
        data!.add(new Data_Review.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data_Review {
  int? id;
  int? rating;
  Null customerServiceRating;
  Null qualityRating;
  Null friendlyRating;
  Null pricingRating;
  String? recommend;
  String? department;
  String? title;
  String? body;
  int? approved;
  String? reviewrateableType;
  int? reviewrateableId;
  String? authorType;
  int? authorId;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Author? author;

  Data_Review(
      {this.id,
      this.rating,
      this.customerServiceRating,
      this.qualityRating,
      this.friendlyRating,
      this.pricingRating,
      this.recommend,
      this.department,
      this.title,
      this.body,
      this.approved,
      this.reviewrateableType,
      this.reviewrateableId,
      this.authorType,
      this.authorId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.author});

  Data_Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    customerServiceRating = json['customer_service_rating'];
    qualityRating = json['quality_rating'];
    friendlyRating = json['friendly_rating'];
    pricingRating = json['pricing_rating'];
    recommend = json['recommend'];
    department = json['department'];
    title = json['title'];
    body = json['body'];
    approved = json['approved'];
    reviewrateableType = json['reviewrateable_type'];
    reviewrateableId = json['reviewrateable_id'];
    authorType = json['author_type'];
    authorId = json['author_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['customer_service_rating'] = this.customerServiceRating;
    data['quality_rating'] = this.qualityRating;
    data['friendly_rating'] = this.friendlyRating;
    data['pricing_rating'] = this.pricingRating;
    data['recommend'] = this.recommend;
    data['department'] = this.department;
    data['title'] = this.title;
    data['body'] = this.body;
    data['approved'] = this.approved;
    data['reviewrateable_type'] = this.reviewrateableType;
    data['reviewrateable_id'] = this.reviewrateableId;
    data['author_type'] = this.authorType;
    data['author_id'] = this.authorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

class Author {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  Null phone;
  Null avatar;
  Null provider;
  Null providerId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Null wallet;
  String? imageProfile;
  int? storeCheck;

  Author(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.avatar,
      this.provider,
      this.providerId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.wallet,
      this.imageProfile,
      this.storeCheck});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    avatar = json['avatar'];
    provider = json['provider'];
    providerId = json['provider_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    wallet = json['wallet'];
    imageProfile = json['image_profile'];
    storeCheck = json['store_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['provider'] = this.provider;
    data['provider_id'] = this.providerId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['wallet'] = this.wallet;
    data['image_profile'] = this.imageProfile;
    data['store_check'] = this.storeCheck;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
Future<List<Data_Review>> fetch_Product_Review() async {
  final response =
      await http.get(Uri.parse('https://api.zeleex.com/api/product/reviews?product_id='+121.toString()));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data']['data'];
  // var jsonConSpecific = jsonResponse['data']['data'][1];
  if (response.statusCode == 200) {

    return jsonCon
        .map((data) => new Data_Review.fromJson(data))
        .toList();
  } else {
    throw Exception("error...");
  }
}

