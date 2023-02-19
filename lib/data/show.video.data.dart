import 'dart:convert';

List<ShowListData> welcomeFromJson(String str) => List<ShowListData>.from(json.decode(str).map((x) => ShowListData.fromJson(x)));

String ShowListDataToJson(List<ShowListData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowListData {
  ShowListData({
    this.categoryName,
  });

  String? categoryName;

  factory ShowListData.fromJson(Map<String, dynamic> json) => ShowListData(
    categoryName: json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
  };
}
