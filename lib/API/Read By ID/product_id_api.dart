import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product_Detail {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Product_Detail(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Product_Detail.fromJson(Map<String, dynamic> json) {
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
  Product? product;
  List<ProductCategory>? productCategory;
  List<ProductInStores>? productInStores;
  List<ProductOutStores>? productOutStores;

  Data(
      {this.product,
      this.productCategory,
      this.productInStores,
      this.productOutStores});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['product_category'] != null) {
      productCategory = <ProductCategory>[];
      json['product_category'].forEach((v) {
        productCategory!.add(new ProductCategory.fromJson(v));
      });
    }
    if (json['product_in_stores'] != null) {
      productInStores = <ProductInStores>[];
      json['product_in_stores'].forEach((v) {
        productInStores!.add(new ProductInStores.fromJson(v));
      });
    }
    if (json['product_out_stores'] != null) {
      productOutStores = <ProductOutStores>[];
      json['product_out_stores'].forEach((v) {
        productOutStores!.add(new ProductOutStores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.productCategory != null) {
      data['product_category'] =
          this.productCategory!.map((v) => v.toJson()).toList();
    }
    if (this.productInStores != null) {
      data['product_in_stores'] =
          this.productInStores!.map((v) => v.toJson()).toList();
    }
    if (this.productOutStores != null) {
      data['product_out_stores'] =
          this.productOutStores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
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
  Image_Product? image;
  List<Images_Product>? images;
  int? favoriteCount;
  int? reviewCount;
  int? price;
  List<Categories>? categories;
  Store? store;
  List<Tags>? tags;
  List<Null>? options;
  List<Skus>? skus;

  Product(
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
      this.categories,
      this.store,
      this.tags,
      this.options,
      this.skus});

  Product.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null
        ? new Image_Product.fromJson(json['image'])
        : null;
    if (json['images'] != null) {
      images = <Images_Product>[];
      json['images'].forEach((v) {
        images!.add(new Images_Product.fromJson(v));
      });
    }
    favoriteCount = json['favorite_count'];
    reviewCount = json['review_count'];
    price = json['price'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    // if (json['options'] != null) {
    //   options = <Null>[];
    //   json['options'].forEach((v) {
    //     options!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['skus'] != null) {
      skus = <Skus>[];
      json['skus'].forEach((v) {
        skus!.add(new Skus.fromJson(v));
      });
    }
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
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    // if (this.options != null) {
    //   data['options'] = this.options!.map((v) => v.toJson()).toList();
    // }
    if (this.skus != null) {
      data['skus'] = this.skus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image_Product {
  String? main;
  String? thumbnail;

  Image_Product({this.main, this.thumbnail});

  Image_Product.fromJson(Map<String, dynamic> json) {
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

class Images_Product {
  String? title;
  String? main;
  String? thumbnail;

  Images_Product({this.title, this.main, this.thumbnail});

  Images_Product.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? status;
  int? order;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Categories(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.order,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    order = json['order'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
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

class Store {
  int? id;
  String? title;
  String? status;
  String? address;
  String? email;
  String? phone;
  String? content;
  Null? lat;
  Null? lng;
  int? reads;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Image_Product? image;
  Image_Product? imageCover;
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
    image = json['image'] != null
        ? new Image_Product.fromJson(json['image'])
        : null;
    imageCover = json['image_cover'] != null
        ? new Image_Product.fromJson(json['image_cover'])
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

class Tags {
  int? id;
  String? title;
  String? description;
  String? status;
  int? order;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tags(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.order,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Skus {
  int? id;
  int? productId;
  String? name;
  int? price;
  int? order;
  int? stock;

  Skus({
    this.id,
    this.productId,
    this.name,
    this.price,
    this.order,
    this.stock,
  });

  Skus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    price = json['price'];
    order = json['order'];
    stock = json['stock'];

    // if (json['values'] != null) {
    //   values = <Null>[];
    //   json['values'].forEach((v) {
    //     values!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['order'] = this.order;
    data['stock'] = this.stock;

    return data;
  }
}

class ProductCategory {
  int? id;
  String? title;
  String? description;
  String? status;
  int? order;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  int? productsCount;

  ProductCategory(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.order,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.productsCount});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    order = json['order'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['order'] = this.order;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['products_count'] = this.productsCount;
    return data;
  }
}

class ProductInStores {
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
  Image_Product? image;
  List<Images_Product>? images;
  int? favoriteCount;
  int? reviewCount;
  int? price;

  ProductInStores(
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
      this.price});

  ProductInStores.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null
        ? new Image_Product.fromJson(json['image'])
        : null;
    if (json['images'] != null) {
      images = <Images_Product>[];
      json['images'].forEach((v) {
        images!.add(new Images_Product.fromJson(v));
      });
    }
    favoriteCount = json['favorite_count'];
    reviewCount = json['review_count'];
    price = json['price'];
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
    return data;
  }
}

class ProductOutStores {
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
  Image_Product? image;
  List<Images_Product>? images;
  int? favoriteCount;
  int? reviewCount;
  int? price;
  Store? store;

  ProductOutStores(
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
      this.store});

  ProductOutStores.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null
        ? new Image_Product.fromJson(json['image'])
        : null;
    if (json['images'] != null) {
      images = <Images_Product>[];
      json['images'].forEach((v) {
        images!.add(new Images_Product.fromJson(v));
      });
    }
    favoriteCount = json['favorite_count'];
    reviewCount = json['review_count'];
    price = json['price'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
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
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

// Future<Product> fetch_Product_ByID() async {
//   var url = "https://sanboxapi.zeleex.com/api/products/1";
//   var response = await http.get(Uri.parse(url));
//   var jsonResponse = json.decode(response.body);
//   var jsonCon = jsonResponse['data']['product'];
//   Product msg = Product.fromJson(jsonCon);
//   //print(msg.images[0].main);
//   return msg;
// }



