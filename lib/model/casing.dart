// To parse this JSON data, do
//
//     final casing = casingFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Casing casingFromJson(String str) => Casing.fromJson(json.decode(str));

String casingToJson(Casing data) => json.encode(data.toJson());

class Casing {
    List<Data> data;

    Casing({
        required this.data,
    });

    factory Casing.fromJson(Map<String, dynamic> json) => Casing(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    String name;
    String desc;
    String imageUrl;
    String size;
    String stok;
    int price;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.name,
        required this.desc,
        required this.imageUrl,
        required this.size,
        required this.stok,
        required this.price,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        desc: json["desc"],
        imageUrl: json["image_url"],
        size: json["size"],
        stok: json["stok"],
        price: json["price"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "image_url": imageUrl,
        "size": size,
        "stok": stok,
        "price": price,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
