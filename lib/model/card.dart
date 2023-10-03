// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  bool? success;
  bool? isAuth;
  String? message;
  List<Result> result;

  CardModel({
    this.success,
    this.isAuth,
    this.message,
    required this.result,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        success: json["success"],
        isAuth: json["isAuth"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "isAuth": isAuth,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  String? uid;
  String? profileBannerImageUrl;

  Result({
    this.uid,
    this.profileBannerImageUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uid: json["uid"],
        profileBannerImageUrl: json["profileBannerImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "profileBannerImageURL": profileBannerImageUrl,
      };
}
