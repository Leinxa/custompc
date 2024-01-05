// To parse this JSON data, do
//
//     final cpu = cpuFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Cpu cpuFromJson(String str) => Cpu.fromJson(json.decode(str));

String cpuToJson(Cpu data) => json.encode(data.toJson());

class Cpu {
    List<Datum> data;

    Cpu({
        required this.data,
    });

    factory Cpu.fromJson(Map<String, dynamic> json) => Cpu(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String decs;
    String type;
    String imageUrl;
    String stok;
    int price;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.name,
        required this.decs,
        required this.type,
        required this.imageUrl,
        required this.stok,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        decs: json["decs"],
        type: json["type"],
        imageUrl: json["image_url"],
        stok: json["stok"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "decs": decs,
        "type": type,
        "image_url": imageUrl,
        "stok": stok,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
