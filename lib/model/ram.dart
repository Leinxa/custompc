// To parse this JSON data, do
//
//     final ram = ramFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Ram ramFromJson(String str) => Ram.fromJson(json.decode(str));

String ramToJson(Ram data) => json.encode(data.toJson());

class Ram {
    List<Data> data;

    Ram({
        required this.data,
    });

    factory Ram.fromJson(Map<String, dynamic> json) => Ram(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    int id;
    String name;
    String desc;
    String size;
    String imageUrl;
    String type;
    String speed;
    String kapasitas;
    String stok;
    int price;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.name,
        required this.desc,
        required this.size,
        required this.imageUrl,
        required this.type,
        required this.speed,
        required this.kapasitas,
        required this.stok,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        size: json["size"],
        imageUrl: json["image_url"],
        type: json["type"],
        speed: json["speed"],
        kapasitas: json["kapasitas"],
        stok: json["stok"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "size": size,
        "image_url": imageUrl,
        "type": type,
        "speed": speed,
        "kapasitas": kapasitas,
        "stok": stok,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
