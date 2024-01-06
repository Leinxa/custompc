// To parse this JSON data, do
//
//     final storage = storageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Storage storageFromJson(String str) => Storage.fromJson(json.decode(str));

String storageToJson(Storage data) => json.encode(data.toJson());

class Storage {
    List<Data> data;

    Storage({
        required this.data,
    });

    factory Storage.fromJson(Map<String, dynamic> json) => Storage(
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
    String type;
    String kapasitas;
    String stok;
    int price;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.name,
        required this.desc,
        required this.imageUrl,
        required this.type,
        required this.kapasitas,
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
        type: json["type"],
        kapasitas: json["kapasitas"],
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
        "type": type,
        "kapasitas": kapasitas,
        "stok": stok,
        "price": price,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
