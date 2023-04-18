class Newfeeds_Model {
  int? id;
  String? title;
  String? description;
  String? dateCreated;
  String? image;

  Newfeeds_Model(
      {this.id, this.title, this.description, this.image, this.dateCreated});
}

class Blog_Info_Model {
  int? id;
  String? title;
  String? description;
  String? content;
  String? status;
  String? dateCreated;
  String? seoTitle;
  String? seoDescription;
  String? image;
  int? storeId;
  int? reads;

  Blog_Info_Model(
      {this.id,
      this.title,
      this.description,
      this.content,
      this.reads,
      this.seoTitle,
      this.image,
      this.dateCreated,
      this.seoDescription});
}
