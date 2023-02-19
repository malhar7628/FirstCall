import 'dart:convert';

List<VideoList> VideoListFromJson(String str) => List<VideoList>.from(json.decode(str).map((x) => VideoList.fromJson(x)));

String VideoListToJson(List<VideoList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoList {
  VideoList({
    this.id,
    this.createdAt,
    this.modifiedAt,
    this.version,
    this.isdeleted,
    this.name,
    this.imgPath,
    this.status,
    this.welcomeNew,
  });

  String? id;
  DateTime? createdAt;
  DateTime? modifiedAt;
  int? version;
  String? isdeleted;
  String? name;
  dynamic? imgPath;
  String? status;
  bool? welcomeNew;

  factory VideoList.fromJson(Map<String, dynamic> json) => VideoList(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
    version: json["version"],
    isdeleted: json["isdeleted"],
    name: json["name"],
    imgPath: json["imgPath"],
    status: json["status"],
    welcomeNew: json["new"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "modifiedAt": modifiedAt?.toIso8601String(),
    "version": version,
    "isdeleted": isdeleted,
    "name": name,
    "imgPath": imgPath,
    "status": status,
    "new": welcomeNew,
  };
}