import 'dart:convert';

List<JobRoleUserModel> jobRoleFromJson(String str) => List<JobRoleUserModel>.from(json.decode(str).map((x) => JobRoleUserModel.fromJson(x)));

String jobRoleToJson(List<JobRoleUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class JobRoleUserModel {
  String? name;
  String? nameCode;
  String? status;
  String? id;

  JobRoleUserModel({
    this.name,
    this.nameCode,
    this.status,
    this.id,
  });



  factory JobRoleUserModel.fromJson(Map<String, dynamic> json) => JobRoleUserModel(
    name: json["name"],
    nameCode: json["nameCode"],
    status: json["status"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "nameCode": nameCode,
    "status": status,
    "id": id,
  };
}


/*import 'dart:convert';

List<UserCarModel> userCarModelFromJson(String str) => List<UserCarModel>.from(
    json.decode(str).map((x) => UserCarModel.fromJson(x)));

String userCarModelToJson(List<UserCarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCarModel {
  UserCarModel({
    required this.id,
    required this.model,
    required this.vehicleNo,
    required this.modelId,


  });

  String id;
  String model;
  String vehicleNo;
  String modelId;

  factory UserCarModel.fromJson(Map<String, dynamic> json) => UserCarModel(
    id: json["id"],
    model: json["model"],
    vehicleNo: json['vehicleNo'],
    modelId: json["modelId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model,
    "vehicleNo": vehicleNo,
    "modelId": modelId,
  };
}*/
