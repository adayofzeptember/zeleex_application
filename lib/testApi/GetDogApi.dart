import 'dart:convert';

//ช่อง ก้อง
GetDogs getDogsFromJson(String str) => GetDogs.fromJson(json.decode(str));

String getDogsToJson(GetDogs data) => json.encode(data.toJson());

class GetDogs {
  GetDogs({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory GetDogs.fromJson(Map<String, dynamic> json) => GetDogs(
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "status": status == null ? null : status,
      };
}
