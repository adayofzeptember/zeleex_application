class PhotosList {
  final List<Photo> photos;

  PhotosList({
    required this.photos,
});

  factory PhotosList.fromJson(List<dynamic> parsedJson) {

    List<Photo> photos = <Photo>[];
    photos = parsedJson.map((i)=>Photo.fromJson(i)).toList();

    return new PhotosList(
      photos: photos
    );
  }
}

class Photo{
  final String id;
  final String title;
  final String url;

  Photo({
   required this.id,
   required this.url,
   required this.title
}) ;

  factory Photo.fromJson(Map<String, dynamic> json){
    return new Photo(
      id: json['id'].toString(),
      title: json['title'],
      url: json['json'],
    );
  }

}