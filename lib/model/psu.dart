// To parse this JSON data, do
//
//     final psu = psuFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Psu psuFromJson(String str) => Psu.fromJson(json.decode(str));

String psuToJson(Psu data) => json.encode(data.toJson());

class Psu {
    List<Data> data;

    Psu({
        required this.data,
    });

    factory Psu.fromJson(Map<String, dynamic> json) => Psu(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    String name;
    String desc;
    String imageUrl;
    String stok;
    int price;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.name,
        required this.desc,
        required this.imageUrl,
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
        "stok": stok,
        "price": price,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
