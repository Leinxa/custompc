// To parse this JSON data, do
//
//     final motherboard = motherboardFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Motherboard motherboardFromJson(String str) => Motherboard.fromJson(json.decode(str));

String motherboardToJson(Motherboard data) => json.encode(data.toJson());

class Motherboard {
    List<Data> data;

    Motherboard({
        required this.data,
    });

    factory Motherboard.fromJson(Map<String, dynamic> json) => Motherboard(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    String nama;
    String desc;
    String imageUrl;
    String stok;
    String chipset;
    String formFactor;
    int ramSlot;
    int minRamSpeed;
    int maxRamSpeed;
    int storageSlot;
    int vgaSlot;
    int price;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.nama,
        required this.desc,
        required this.imageUrl,
        required this.stok,
        required this.chipset,
        required this.formFactor,
        required this.ramSlot,
        required this.minRamSpeed,
        required this.maxRamSpeed,
        required this.storageSlot,
        required this.vgaSlot,
        required this.price,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nama: json["nama"],
        desc: json["desc"],
        imageUrl: json["image_url"],
        stok: json["stok"],
        chipset: json["chipset"],
        formFactor: json["form_factor"],
        ramSlot: json["ram_slot"],
        minRamSpeed: json["min_ram_speed"],
        maxRamSpeed: json["max_ram_speed"],
        storageSlot: json["storage_slot"],
        vgaSlot: json["vga_slot"],
        price: json["price"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "desc": desc,
        "image_url": imageUrl,
        "stok": stok,
        "chipset": chipset,
        "form_factor": formFactor,
        "ram_slot": ramSlot,
        "min_ram_speed": minRamSpeed,
        "max_ram_speed": maxRamSpeed,
        "storage_slot": storageSlot,
        "vga_slot": vgaSlot,
        "price": price,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
