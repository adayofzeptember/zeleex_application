import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Anmal_Detail {
  String? responseCode;
  String? responseStatus;
  String? responseMessage;
  String? sessionID;
  int? serverDateTimeMS;
  String? serverDatetime;
  Data? data;

  Anmal_Detail(
      {this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.sessionID,
      this.serverDateTimeMS,
      this.serverDatetime,
      this.data});

  Anmal_Detail.fromJson(Map<String, dynamic> json) {
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
  Animal? animal;
  List<AnimalCategory>? animalCategory;
  List<AnimalInStores>? animalInStores;
  List<AnimalOutStores>? animalOutStores;

  Data(
      {this.animal,
      this.animalCategory,
      this.animalInStores,
      this.animalOutStores});

  Data.fromJson(Map<String, dynamic> json) {
    animal =
        json['animal'] != null ? new Animal.fromJson(json['animal']) : null;
    if (json['animal_category'] != null) {
      animalCategory = <AnimalCategory>[];
      json['animal_category'].forEach((v) {
        animalCategory!.add(new AnimalCategory.fromJson(v));
      });
    }
    if (json['animal_in_stores'] != null) {
      animalInStores = <AnimalInStores>[];
      json['animal_in_stores'].forEach((v) {
        animalInStores!.add(new AnimalInStores.fromJson(v));
      });
    }
    if (json['animal_out_stores'] != null) {
      animalOutStores = <AnimalOutStores>[];
      json['animal_out_stores'].forEach((v) {
        animalOutStores!.add(new AnimalOutStores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.animal != null) {
      data['animal'] = this.animal!.toJson();
    }
    if (this.animalCategory != null) {
      data['animal_category'] =
          this.animalCategory!.map((v) => v.toJson()).toList();
    }
    if (this.animalInStores != null) {
      data['animal_in_stores'] =
          this.animalInStores!.map((v) => v.toJson()).toList();
    }
    if (this.animalOutStores != null) {
      data['animal_out_stores'] =
          this.animalOutStores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Animal {
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
  Image_Animal? image;
  List<Images>? images;
  List<Categories>? categories;
  Store? store;

  Animal(
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
      this.store});

  Animal.fromJson(Map<String, dynamic> json) {
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
    image =
        json['image'] != null ? new Image_Animal.fromJson(json['image']) : null;
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
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Image_Animal {
  String? main;
  String? thumbnail;

  Image_Animal({this.main, this.thumbnail});

  Image_Animal.fromJson(Map<String, dynamic> json) {
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
  Null parentId;
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

class Store {
  int? id;
  String? title;
  String? status;
  String? address;
  String? email;
  String? phone;
  String? content;
  Null lat;
  Null lng;
  int? reads;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Image_Animal? image;
  Image_Animal? imageCover;
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
    image =
        json['image'] != null ? new Image_Animal.fromJson(json['image']) : null;
    imageCover = json['image_cover'] != null
        ? new Image_Animal.fromJson(json['image_cover'])
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

class AnimalCategory {
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
  int? animalsCount;

  AnimalCategory(
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
      this.animalsCount});

  AnimalCategory.fromJson(Map<String, dynamic> json) {
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
    animalsCount = json['animals_count'];
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
    data['animals_count'] = this.animalsCount;
    return data;
  }
}

class AnimalInStores {
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
  Image_Animal? image;
  List<Images>? images;

  AnimalInStores(
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
      this.images});

  AnimalInStores.fromJson(Map<String, dynamic> json) {
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
    image =
        json['image'] != null ? new Image_Animal.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
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
    return data;
  }
}

class AnimalOutStores {
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
  Image_Animal? image;
  List<Images>? images;
  Store? store;

  AnimalOutStores(
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
      this.store});

  AnimalOutStores.fromJson(Map<String, dynamic> json) {
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
    image =
        json['image'] != null ? new Image_Animal.fromJson(json['image']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((eachIMG) {
        images!.add(new Images.fromJson(eachIMG));
      });
    }
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

    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

Future<Animal> fetch_Animal_ByID() async {
  var url = "https://api.zeleex.com/api/animals/198";
  final response = await http.get(Uri.parse(url), headers: {
    //'Accept: application/json'

    'Content-Type': 'application/json',
    'Charset': 'utf-8'
  });
  var jsonResponse = json.decode(response.body);
  var jsonCon = jsonResponse['data']['animal'];
  Animal msg = Animal.fromJson(jsonCon);
  print(msg.title);
  print(msg.id);
  return msg;
}
