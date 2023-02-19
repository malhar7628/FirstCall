import 'dart:convert';

List<ShowVideoModel> showVideoModelFromJson(String str) => List<ShowVideoModel>.from(json.decode(str).map((x) => ShowVideoModel.fromJson(x)));

String showVideoModelToJson(List<ShowVideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowVideoModel {
  ShowVideoModel({
    this.id,
    this.unid,
    this.filepath,
    this.applicationdate,
    this.sharestatus,
    this.actionstatus,
    this.sharestatusflag,
    this.userInfo,
    this.auditionInfo,
  });

  String? id;
  String? unid;
  String? filepath;
  String? applicationdate;
  String? sharestatus;
  String? actionstatus;
  int? sharestatusflag;
  UserInfo? userInfo;
  AuditionInfo? auditionInfo;

  factory ShowVideoModel.fromJson(Map<String, dynamic> json) => ShowVideoModel(
    id: json["id"] == null ? null : json["id"],
    unid: json["unid"] == null ? null : json["unid"],
    filepath: json["filepath"] == null ? null : json["filepath"],
    applicationdate: json["applicationdate"] == null ? null : json["applicationdate"],
    sharestatus: json["sharestatus"] == null ? null : json["sharestatus"],
    actionstatus: json["actionstatus"] == null ? null : json["actionstatus"],
    sharestatusflag: json["sharestatusflag"] == null ? null : json["sharestatusflag"],
    userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
    auditionInfo: json["userInfo"] == null ? null : AuditionInfo.fromJson(json["auditionInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "unid": unid == null ? null : unid,
    "filepath": filepath == null ? null : filepath,
    "applicationdate": applicationdate == null ? null : applicationdate,
    "sharestatus": sharestatus == null ? null : sharestatus,
    "actionstatus": actionstatus == null ? null : actionstatus,
    "sharestatusflag": sharestatusflag == null ? null : sharestatusflag,
    "userInfo": userInfo == null ? null : userInfo?.toJson(),
    "auditionInfo": auditionInfo == null ?  null : auditionInfo?.toJson(),
  };
}

class AuditionInfo {
  AuditionInfo({
    this.id,
    this.auditionid,
    this.name,
    this.deadlinedate,
    this.description,
    this.instruction,
    this.information,
    this.location,
    this.filepath,
    this.totalappcount,
  });

  String? id;
  String? auditionid;
  String? name;
  String? deadlinedate;
  String? description;
  String? instruction;
  String? information;
  String? location;
  String? filepath;
  int? totalappcount;

  factory AuditionInfo.fromJson(Map<String, dynamic> json) => AuditionInfo(
    id: json["id"],
    auditionid: json["auditionid"],
    name: json["name"],
    deadlinedate: json["deadlinedate"],
    description: json["description"],
    instruction: json["instruction"],
    information: json["information"],
    location: json["location"],
    filepath: json["filepath"],
    totalappcount: json["totalappcount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "auditionid": auditionid == null ? null : auditionid,
    "name": name,
    "deadlinedate": deadlinedate,
    "description": description,
    "instruction": instruction,
    "information": information,
    "location": location,
    "filepath": filepath,
    "totalappcount": totalappcount,
  };
}

class UserInfo {
  UserInfo({
    this.id,
    this.userfname,
    this.userlname,
    this.email,
    this.mobilenumber,
  });

  String? id;
  String? userfname;
  String? userlname;
  String? email;
  String? mobilenumber;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"] == null ? null : json["id"],
    userfname: json["userfname"] == null ? null : json["userfname"],
    userlname: json["userlname"] == null ? null : json["userlname"],
    email: json["email"] == null ? null : json["email"],
    mobilenumber: json["mobilenumber"] == null ? null : json["mobilenumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "userfname": userfname,
    "userlname": userlname,
    "email": email,
    "mobilenumber": mobilenumber,
  };
}