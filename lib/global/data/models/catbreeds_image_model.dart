// To parse this JSON data, do
//
//     final catbreedsImageModel = catbreedsImageModelFromJson(jsonString);

import 'dart:convert';

import 'package:prueba_flutter_pragma/global/domain/models/models.dart';

CatbreedsImageModel catbreedsImageModelFromJson(String str) =>
    CatbreedsImageModel.fromJson(json.decode(str));

String catbreedsImageModelToJson(CatbreedsImageModel data) =>
    json.encode(data.toJson());

class CatbreedsImageModel implements CatbreedsImageModelInterface {
  @override
  String? id;
  @override
  String? url;
  @override
  int? width;
  @override
  int? height;

  CatbreedsImageModel({
    this.id,
    this.url,
    this.width,
    this.height,
  });

  CatbreedsImageModel copyWith({
    String? id,
    String? url,
    int? width,
    int? height,
  }) =>
      CatbreedsImageModel(
        id: id ?? this.id,
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory CatbreedsImageModel.fromJson(Map<String, dynamic> json) =>
      CatbreedsImageModel(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}
