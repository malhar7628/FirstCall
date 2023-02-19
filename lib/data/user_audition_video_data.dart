import 'dart:convert';

List<UserAuditionVideoListData> userAuditionVideoListDataFromJson(String str) => List<UserAuditionVideoListData>.from(json.decode(str).map((x) => UserAuditionVideoListData.fromJson(x)));

String userAuditionVideoListDataToJson(List<UserAuditionVideoListData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAuditionVideoListData {
  UserAuditionVideoListData({
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
  DateTime? applicationdate;
  String? sharestatus;
  String? actionstatus;
  int? sharestatusflag;
  UserInfo? userInfo;
  AuditionInfo? auditionInfo;

  factory UserAuditionVideoListData.fromJson(Map<String, dynamic> json) => UserAuditionVideoListData(
    id: json["id"] == null ? null : json["id"],
    unid: json["unid"] == null ? null : json["unid"],
    filepath: json["filepath"] == null ? null : json["filepath"],
    applicationdate: json["applicationdate"] == null ? null : DateTime.parse(json["applicationdate"]),
    sharestatus: json["sharestatus"] == null ? null : json["sharestatus"],
    actionstatus: json["actionstatus"] == null ? null : json["actionstatus"],
    sharestatusflag: json["sharestatusflag"] == null ? null : json["sharestatusflag"],
    userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
    auditionInfo: AuditionInfo.fromJson(json["auditionInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "unid": unid == null ? null : unid,
    "filepath": filepath == null ? null : filepath,
    "applicationdate": applicationdate == null ? null : "${applicationdate?.year.toString().padLeft(4, '0')}-${applicationdate?.month.toString().padLeft(2, '0')}-${applicationdate?.day.toString().padLeft(2, '0')}",
    "sharestatus": sharestatus == null ? null : sharestatus,
    "actionstatus": actionstatus == null ? null : actionstatus,
    "sharestatusflag": sharestatusflag == null ? null : sharestatusflag,
    "userInfo": userInfo == null ? null : userInfo?.toJson(),
    "auditionInfo": auditionInfo == null ? null : auditionInfo?.toJson(),
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
    id: json["id"] == null ? null : json["id"],
    auditionid: json["auditionid"] == null ? null : json["auditionid"],
    name: json["name"] == null ? null : json["name"],
    deadlinedate: json["deadlinedate"] == null ? null : json["deadlinedate"],
    description: json["description"] == null ? null : json["description"],
    instruction: json["instruction"] == null ? null : json["instruction"],
    information: json["information"] == null ? null : json["information"],
    location: json["location"] == null ? null : json["location"],
    filepath: json["filepath"] == null ? null : json["filepath"],
    totalappcount: json["totalappcount"] == null ? null : json["totalappcount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "auditionid": auditionid,
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
    id: json["id"],
    userfname: json["userfname"],
    userlname: json["userlname"],
    email: json["email"],
    mobilenumber: json["mobilenumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userfname": userfname,
    "userlname": userlname,
    "email": email,
    "mobilenumber": mobilenumber,
  };
}