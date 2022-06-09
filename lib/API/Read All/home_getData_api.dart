import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class HomeGetData {
//   String? responseCode;
//   String? responseStatus;
//   String? responseMessage;
//   String? sessionID;
//   int? serverDateTimeMS;
//   String? serverDatetime;
//   Data? data;

//   HomeGetData(
//       {this.responseCode,
//       this.responseStatus,
//       this.responseMessage,
//       this.sessionID,
//       this.serverDateTimeMS,
//       this.serverDatetime,
//       this.data});

//   HomeGetData.fromJson(Map<String, dynamic> json) {
//     responseCode = json['responseCode'];
//     responseStatus = json['responseStatus'];
//     responseMessage = json['responseMessage'];
//     sessionID = json['sessionID'];
//     serverDateTimeMS = json['serverDateTimeMS'];
//     serverDatetime = json['serverDatetime'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['responseCode'] = this.responseCode;
//     data['responseStatus'] = this.responseStatus;
//     data['responseMessage'] = this.responseMessage;
//     data['sessionID'] = this.sessionID;
//     data['serverDateTimeMS'] = this.serverDateTimeMS;
//     data['serverDatetime'] = this.serverDatetime;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<AnimalCat01>? animalCat01;
//   List<ProductCat01>? productCat01;

//   List<Ads01>? ads01;

//   Data({
//     this.animalCat01,
//     this.productCat01,
//     this.ads01,
//   });

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['animal_cat_01'] != null) {
//       animalCat01 = <AnimalCat01>[];
//       json['animal_cat_01'].forEach((v) {
//         animalCat01!.add(new AnimalCat01.fromJson(v));
//       });
//     }
//     if (json['product_cat_01'] != null) {
//       productCat01 = <ProductCat01>[];
//       json['product_cat_01'].forEach((v) {
//         productCat01!.add(new ProductCat01.fromJson(v));
//       });
//     }

//     if (json['ads_01'] != null) {
//       ads01 = <Ads01>[];
//       json['ads_01'].forEach((v) {
//         ads01!.add(new Ads01.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.animalCat01 != null) {
//       data['animal_cat_01'] = this.animalCat01!.map((v) => v.toJson()).toList();
//     }
//     if (this.productCat01 != null) {
//       data['product_cat_01'] =
//           this.productCat01!.map((v) => v.toJson()).toList();
//     }

//     if (this.ads01 != null) {
//       data['ads_01'] = this.ads01!.map((v) => v.toJson()).toList();
//     }

//     return data;
//   }
// }

class AnimalCat01 {
  int? id;
  String? title;
  String? status;
  String? content;
  int? storeId;
  int? speciesId;
  String? speciesType;
  String? sold;
  String? seoTitle;
  String? seoDescription;
  int? price;
  int? reads;
  String? description;
  String? createdAt;
  String? updatedAt;
  ImageCat? image;
  List<Images>? images;
  List<Categories>? categories;

  AnimalCat01(
      {this.id,
      this.title,
      this.status,
      this.content,
      this.storeId,
      this.speciesId,
      this.speciesType,
      this.sold,
      this.seoTitle,
      this.seoDescription,
      this.price,
      this.reads,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.images,
      this.categories});

  AnimalCat01.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    content = json['content'];
    storeId = json['store_id'];
    speciesId = json['species_id'];
    speciesType = json['species_type'];
    sold = json['sold'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    price = json['price'];
    reads = json['reads'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new ImageCat.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['content'] = this.content;
    data['store_id'] = this.storeId;
    data['species_id'] = this.speciesId;
    data['species_type'] = this.speciesType;
    data['sold'] = this.sold;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['price'] = this.price;
    data['reads'] = this.reads;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageCat {
  String? main;
  String? thumbnail;

  ImageCat({this.main, this.thumbnail});

  ImageCat.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main'] = this.main;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Images {
  String? title;
  String? main;
  String? thumbnail;

  Images({this.title, this.main, this.thumbnail});

  Images.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    main = json['main'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['main'] = this.main;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Categories {
  int? id;
  String? title;
  String? status;
  String? description;
  String? order;
  int? iLft;
  int? iRgt;
  Null? parentId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Categories(
      {this.id,
      this.title,
      this.status,
      this.description,
      this.order,
      this.iLft,
      this.iRgt,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    description = json['description'];
    order = json['order'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['description'] = this.description;
    data['order'] = this.order;

    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class ProductCat01 {
  int? id;
  String? title;
  String? description;
  String? content;
  String? status;
  String? seoTitle;
  String? seoDescription;
  int? reads;
  int? storeId;
  int? brandId;
  String? conditionType;
  String? createdAt;
  String? updatedAt;
  ImageCat? image;
  List<Images>? images;
  int? favoriteCount;
  int? reviewCount;
  int? price;
 // List<Categories>? categories;

  ProductCat01(
      {this.id,
      this.title,
      this.description,
      this.content,
      this.status,
      this.seoTitle,
      this.seoDescription,
      this.reads,
      this.storeId,
      this.brandId,
      this.conditionType,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.images,
      this.favoriteCount,
      this.reviewCount,
      this.price,
     // this.categories
      
      });

  ProductCat01.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    status = json['status'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    reads = json['reads'];
    storeId = json['store_id'];
    brandId = json['brand_id'];
    conditionType = json['condition_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new ImageCat.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    favoriteCount = json['favorite_count'];
    reviewCount = json['review_count'];
    price = json['price'];
    // if (json['categories'] != null) {
    //   categories = <Categories>[];
    //   json['categories'].forEach((v) {
    //     categories!.add(new Categories.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['content'] = this.content;
    data['status'] = this.status;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['reads'] = this.reads;
    data['store_id'] = this.storeId;
    data['brand_id'] = this.brandId;
    data['condition_type'] = this.conditionType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['favorite_count'] = this.favoriteCount;
    data['review_count'] = this.reviewCount;
    data['price'] = this.price;
    // if (this.categories != null) {
    //   data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Pivot {
  int? productId;
  int? categoryId;

  Pivot({this.productId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class Ads01 {
  int? id;
  String? title;
  String? status;
  int? order;
  String? link;
  String? createdAt;
  String? updatedAt;
  String? image;

  Ads01(
      {this.id,
      this.title,
      this.status,
      this.order,
      this.link,
      this.createdAt,
      this.updatedAt,
      this.image});

  Ads01.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    order = json['order'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['order'] = this.order;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}

Future<List<AnimalCat01>> fetch_Home_animals() async {
  final response =
      await http.get(Uri.parse('https://api.zeleex.com/api/home'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data']['animal_cat_01'];
  //print(jsonResponse['data']['animal_cat_01']);

  if (response.statusCode == 200) {
    // List jsonResponse = json.decode(response.body);
    return jsonCon.map((data) => new AnimalCat01.fromJson(data)).toList();
  } else {
    throw Exception("error...");
  }
}


Future<List<ProductCat01>> fetch_Home_products() async {
  final response =
      await http.get(Uri.parse('https://api.zeleex.com/api/home'));

  var jsonResponse = json.decode(response.body);
  List jsonCon = jsonResponse['data']['product_cat_01'];
 // print(jsonResponse['data']['product_cat_01']);

  if (response.statusCode == 200) {
    // List jsonResponse = json.decode(response.body);
    return jsonCon.map((data) => ProductCat01.fromJson(data)).toList();
  } else {
    throw Exception("error...");
  }
}
