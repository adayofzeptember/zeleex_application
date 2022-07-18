import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class Animals_All {
//   String? responseCode;
//   String? responseStatus;
//   String? responseMessage;
//   String? sessionID;
//   int? serverDateTimeMS;
//   String? serverDatetime;
//   Data? data;

//   Animals_All(
//       {this.responseCode,
//       this.responseStatus,
//       this.responseMessage,
//       this.sessionID,
//       this.serverDateTimeMS,
//       this.serverDatetime,
//       this.data});

//   Animals_All.fromJson(Map<String, dynamic> json) {
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
//   int? currentPage;
//   List<Data_Animal_ReadAll>? data_anm;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   String? nextPageUrl;
//   String? path;
//   int? perPage;
//   Null? prevPageUrl;
//   int? to;
//   int? total;

//   Data(
//       {this.currentPage,
//       this.data_anm,
//       this.firstPageUrl,
//       this.from,
//       this.lastPage,
//       this.lastPageUrl,
//       this.links,
//       this.nextPageUrl,
//       this.path,
//       this.perPage,
//       this.prevPageUrl,
//       this.to,
//       this.total});

//   Data.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data_anm = <Data_Animal_ReadAll>[];
//       json['data'].forEach((v) {
//         data_anm!.add(new Data_Animal_ReadAll.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links!.add(new Links.fromJson(v));
//       });
//     }
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     if (this.data_anm != null) {
//       data['data'] = this.data_anm!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this.firstPageUrl;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['last_page_url'] = this.lastPageUrl;
//     if (this.links != null) {
//       data['links'] = this.links!.map((v) => v.toJson()).toList();
//     }
//     data['next_page_url'] = this.nextPageUrl;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['prev_page_url'] = this.prevPageUrl;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }

// class Data_Animal_ReadAll {
//   int? id;
//   String? title;
//   String? status;
//   String? content;
//   int? storeId;
//   int? speciesId;
//   String? speciesType;
//   String? sold;
//   String? seoTitle;
//   String? seoDescription;
//   int? price;
//   int? reads;
//   String? description;
//   String? createdAt;
//   String? updatedAt;
//   Image_forAnimal? image;
//   List<Images>? images;
//   List<Categories>? categories;
//   Species? species;
//   //Store? store;

//   Data_Animal_ReadAll({
//     this.id,
//     this.title,
//     this.status,
//     this.content,
//     this.storeId,
//     this.speciesId,
//     this.speciesType,
//     this.sold,
//     this.seoTitle,
//     this.seoDescription,
//     this.price,
//     this.reads,
//     this.description,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.images,
//     this.categories,
//     this.species,
//     //  this.store
//   });

//   Data_Animal_ReadAll.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     status = json['status'];
//     content = json['content'];
//     storeId = json['store_id'];
//     speciesId = json['species_id'];
//     speciesType = json['species_type'];
//     sold = json['sold'];
//     seoTitle = json['seo_title'];
//     seoDescription = json['seo_description'];
//     price = json['price'];
//     reads = json['reads'];
//     description = json['description'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     image = json['image'] != null
//         ? new Image_forAnimal.fromJson(json['image'])
//         : null;
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//     if (json['categories'] != null) {
//       categories = <Categories>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//     species =
//         json['species'] != null ? new Species.fromJson(json['species']) : null;
//     // store = json['store'] != null ? new Store.fromJson(json['store']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['status'] = this.status;
//     data['content'] = this.content;
//     data['store_id'] = this.storeId;
//     data['species_id'] = this.speciesId;
//     data['species_type'] = this.speciesType;
//     data['sold'] = this.sold;
//     data['seo_title'] = this.seoTitle;
//     data['seo_description'] = this.seoDescription;
//     data['price'] = this.price;
//     data['reads'] = this.reads;
//     data['description'] = this.description;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.image != null) {
//       data['image'] = this.image!.toJson();
//     }
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     if (this.species != null) {
//       data['species'] = this.species!.toJson();
//     }
//     // if (this.store != null) {
//     //   data['store'] = this.store!.toJson();
//     // }
//     return data;
//   }
// }

// class Image_forAnimal {
//   String? main;
//   String? thumbnail;

//   Image_forAnimal({this.main, this.thumbnail});

//   Image_forAnimal.fromJson(Map<String, dynamic> json) {
//     main = json['main'];
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['main'] = this.main;
//     data['thumbnail'] = this.thumbnail;
//     return data;
//   }
// }

// class Images {
//   String? title;
//   String? main;
//   String? thumbnail;

//   Images({this.title, this.main, this.thumbnail});

//   Images.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     main = json['main'];
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['main'] = this.main;
//     data['thumbnail'] = this.thumbnail;
//     return data;
//   }
// }

// class Categories {
//   int? id;
//   String? title;
//   String? status;
//   String? description;
//   String? order;
//   int? iLft;
//   int? iRgt;
//   Null? parentId;
//   String? createdAt;
//   String? updatedAt;
//   Pivot? pivot;

//   Categories(
//       {this.id,
//       this.title,
//       this.status,
//       this.description,
//       this.order,
//       this.iLft,
//       this.iRgt,
//       this.parentId,
//       this.createdAt,
//       this.updatedAt,
//       this.pivot});

//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     status = json['status'];
//     description = json['description'];
//     order = json['order'];
//     iLft = json['_lft'];
//     iRgt = json['_rgt'];
//     parentId = json['parent_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['status'] = this.status;
//     data['description'] = this.description;
//     data['order'] = this.order;
//     data['_lft'] = this.iLft;
//     data['_rgt'] = this.iRgt;
//     data['parent_id'] = this.parentId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot!.toJson();
//     }
//     return data;
//   }
// }

// class Pivot {
//   int? animalId;
//   int? categoryId;

//   Pivot({this.animalId, this.categoryId});

//   Pivot.fromJson(Map<String, dynamic> json) {
//     animalId = json['animal_id'];
//     categoryId = json['category_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['animal_id'] = this.animalId;
//     data['category_id'] = this.categoryId;
//     return data;
//   }
// }

// class Species {
//   int? id;
//   String? title;
//   String? description;
//   int? order;
//   String? status;
//   Null? createdAt;
//   Null? updatedAt;

//   Species(
//       {this.id,
//       this.title,
//       this.description,
//       this.order,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   Species.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     order = json['order'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['order'] = this.order;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// // class Store {
// //   int? id;
// //   String? title;
// //   String? status;
// //   String? address;
// //   String? email;
// //   String? phone;
// //   String? content;
// //   Null? lat;
// //   Null? lng;
// //   int? reads;
// //   int? userId;
// //   String? createdAt;
// //   String? updatedAt;
// //   Image_forAnimal? image;
// //   Image? imageCover;
// //   int? productCount;
// //   int? animalCount;
// //   int? blogCount;
// //   int? subscribeCount;

// //   Store(
// //       {this.id,
// //       this.title,
// //       this.status,
// //       this.address,
// //       this.email,
// //       this.phone,
// //       this.content,
// //       this.lat,
// //       this.lng,
// //       this.reads,
// //       this.userId,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.image,
// //       this.imageCover,
// //       this.productCount,
// //       this.animalCount,
// //       this.blogCount,
// //       this.subscribeCount});

// //   Store.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     title = json['title'];
// //     status = json['status'];
// //     address = json['address'];
// //     email = json['email'];
// //     phone = json['phone'];
// //     content = json['content'];
// //     lat = json['lat'];
// //     lng = json['lng'];
// //     reads = json['reads'];
// //     userId = json['user_id'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     image = json['image'] != null ? new Image.fromJson(json['image']) : null;
// //     imageCover = json['image_cover'] != null
// //         ? new Image.fromJson(json['image_cover'])
// //         : null;
// //     productCount = json['product_count'];
// //     animalCount = json['animal_count'];
// //     blogCount = json['blog_count'];
// //     subscribeCount = json['subscribe_count'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['title'] = this.title;
// //     data['status'] = this.status;
// //     data['address'] = this.address;
// //     data['email'] = this.email;
// //     data['phone'] = this.phone;
// //     data['content'] = this.content;
// //     data['lat'] = this.lat;
// //     data['lng'] = this.lng;
// //     data['reads'] = this.reads;
// //     data['user_id'] = this.userId;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     if (this.image != null) {
// //       data['image'] = this.image!.toJson();
// //     }
// //     if (this.imageCover != null) {
// //       data['image_cover'] = this.imageCover!.toJson();
// //     }
// //     data['product_count'] = this.productCount;
// //     data['animal_count'] = this.animalCount;
// //     data['blog_count'] = this.blogCount;
// //     data['subscribe_count'] = this.subscribeCount;
// //     return data;
// //   }
// // }

// class Links {
//   String? url;
//   String? label;
//   bool? active;

//   Links({this.url, this.label, this.active});

//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }

//!=================================================================================================================================

class Animal_All {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Animal_All(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Animal_All.fromJson(Map<String, dynamic> json) {
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
  List<Data_Animal_All>? data_anm;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data_anm,
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
      data_anm = <Data_Animal_All>[];
      json['data'].forEach((v) {
        data_anm!.add(new Data_Animal_All.fromJson(v));
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
    if (this.data_anm != null) {
      data['data'] = this.data_anm!.map((v) => v.toJson()).toList();
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

class Data_Animal_All {
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
  Image? image;
  List<Images>? images;
  List<Categories>? categories;
  Species? species;
  Store? store;

  Data_Animal_All(
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
      this.categories,
      this.species,
      this.store});

  Data_Animal_All.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
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
    species =
        json['species'] != null ? new Species.fromJson(json['species']) : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
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
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Image {
  String? main;
  String? thumbnail;

  Image({this.main, this.thumbnail});

  Image.fromJson(Map<String, dynamic> json) {
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
  int? parentId;
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
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? animalId;
  int? categoryId;

  Pivot({this.animalId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    animalId = json['animal_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animal_id'] = this.animalId;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class Species {
  int? id;
  String? title;
  String? description;
  int? order;
  String? status;
  Null? createdAt;
  Null? updatedAt;

  Species(
      {this.id,
      this.title,
      this.description,
      this.order,
      this.status,
      this.createdAt,
      this.updatedAt});

  Species.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Store {
  int? id;
  String? title;
  String? status;
  String? address;
  String? email;
  String? phone;
  String? content;
  double? lat;
  double? lng;
  int? reads;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Image? image;
  Image? imageCover;
  int? productCount;
  int? animalCount;
  int? blogCount;
  int? subscribeCount;

  Store(
      {this.id,
      this.title,
      this.status,
      this.address,
      this.email,
      this.phone,
      this.content,
      this.lat,
      this.lng,
      this.reads,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.imageCover,
      this.productCount,
      this.animalCount,
      this.blogCount,
      this.subscribeCount});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    content = json['content'];
    lat = json['lat'];
    lng = json['lng'];
    reads = json['reads'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    imageCover = json['image_cover'] != null
        ? new Image.fromJson(json['image_cover'])
        : null;
    productCount = json['product_count'];
    animalCount = json['animal_count'];
    blogCount = json['blog_count'];
    subscribeCount = json['subscribe_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['content'] = this.content;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['reads'] = this.reads;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.imageCover != null) {
      data['image_cover'] = this.imageCover!.toJson();
    }
    data['product_count'] = this.productCount;
    data['animal_count'] = this.animalCount;
    data['blog_count'] = this.blogCount;
    data['subscribe_count'] = this.subscribeCount;
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
