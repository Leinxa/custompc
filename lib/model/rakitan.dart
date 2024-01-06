// To parse this JSON data, do
//
//     final rakitan = rakitanFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Rakitan rakitanFromJson(String str) => Rakitan.fromJson(json.decode(str));

String rakitanToJson(Rakitan data) => json.encode(data.toJson());

class Rakitan {
    List<Datum> data;

    Rakitan({
        required this.data,
    });

    factory Rakitan.fromJson(Map<String, dynamic> json) => Rakitan(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String userId;
    String casingId;
    String motherboardId;
    String cpuId;
    String vgaId;
    String coolerId;
    String psuId;
    String totalPrice;
    DateTime createdAt;
    DateTime updatedAt;
    List<ListStorage> listStorages;
    List<ListRam> listRams;
    Casing cpu;
    Casing vga;
    Casing casing;
    Casing cooler;
    Casing psu;
    Motherboard motherboard;

    Datum({
        required this.id,
        required this.name,
        required this.userId,
        required this.casingId,
        required this.motherboardId,
        required this.cpuId,
        required this.vgaId,
        required this.coolerId,
        required this.psuId,
        required this.totalPrice,
        required this.createdAt,
        required this.updatedAt,
        required this.listStorages,
        required this.listRams,
        required this.cpu,
        required this.vga,
        required this.casing,
        required this.cooler,
        required this.psu,
        required this.motherboard,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        casingId: json["casing_id"],
        motherboardId: json["motherboard_id"],
        cpuId: json["cpu_id"],
        vgaId: json["vga_id"],
        coolerId: json["cooler_id"],
        psuId: json["psu_id"],
        totalPrice: json["Total Price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        listStorages: List<ListStorage>.from(json["list_storages"].map((x) => ListStorage.fromJson(x))),
        listRams: List<ListRam>.from(json["list_rams"].map((x) => ListRam.fromJson(x))),
        cpu: Casing.fromJson(json["cpu"]),
        vga: Casing.fromJson(json["vga"]),
        casing: Casing.fromJson(json["casing"]),
        cooler: Casing.fromJson(json["cooler"]),
        psu: Casing.fromJson(json["psu"]),
        motherboard: Motherboard.fromJson(json["motherboard"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "casing_id": casingId,
        "motherboard_id": motherboardId,
        "cpu_id": cpuId,
        "vga_id": vgaId,
        "cooler_id": coolerId,
        "psu_id": psuId,
        "Total Price": totalPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "list_storages": List<dynamic>.from(listStorages.map((x) => x.toJson())),
        "list_rams": List<dynamic>.from(listRams.map((x) => x.toJson())),
        "cpu": cpu.toJson(),
        "vga": vga.toJson(),
        "casing": casing.toJson(),
        "cooler": cooler.toJson(),
        "psu": psu.toJson(),
        "motherboard": motherboard.toJson(),
    };
}

class Casing {
    int id;
    String name;
    String desc;
    String imageUrl;
    String stok;
    String size;
    int price;
    DateTime createdAt;
    DateTime updatedAt;
    String decs;
    String type;
    String speed;
    String kapasitas;

    Casing({
        required this.id,
        required this.name,
        required this.desc,
        required this.imageUrl,
        required this.stok,
        required this.size,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
        required this.decs,
        required this.type,
        required this.speed,
        required this.kapasitas,
    });

    factory Casing.fromJson(Map<String, dynamic> json) => Casing(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        imageUrl: json["image_url"],
        stok: json["stok"],
        size: json["size"]??" ",
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        decs: json["decs"]?? " ",
        type: json["type"],
        speed: json["speed"],
        kapasitas: json["kapasitas"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "image_url": imageUrl,
        "stok": stok,
        "size": size,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "decs": decs,
        "type": type,
        "speed": speed,
        "kapasitas": kapasitas,
    };
}

class ListRam {
    String rakitanId;
    String ramId;
    DateTime createdAt;
    DateTime updatedAt;
    Casing ram;

    ListRam({
        required this.rakitanId,
        required this.ramId,
        required this.createdAt,
        required this.updatedAt,
        required this.ram,
    });

    factory ListRam.fromJson(Map<String, dynamic> json) => ListRam(
        rakitanId: json["rakitan_id"],
        ramId: json["ram_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ram: Casing.fromJson(json["ram"]),
    );

    Map<String, dynamic> toJson() => {
        "rakitan_id": rakitanId,
        "ram_id": ramId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ram": ram.toJson(),
    };
}

class ListStorage {
    String rakitanId;
    String storageId;
    DateTime createdAt;
    DateTime updatedAt;
    Casing storage;

    ListStorage({
        required this.rakitanId,
        required this.storageId,
        required this.createdAt,
        required this.updatedAt,
        required this.storage,
    });

    factory ListStorage.fromJson(Map<String, dynamic> json) => ListStorage(
        rakitanId: json["rakitan_id"],
        storageId: json["storage_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        storage: Casing.fromJson(json["storage"]),
    );

    Map<String, dynamic> toJson() => {
        "rakitan_id": rakitanId,
        "storage_id": storageId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "storage": storage.toJson(),
    };
}

class Motherboard {
    int id;
    String nama;
    String chipset;
    String imageUrl;
    String formFactor;
    String desc;
    String stok;
    int ramSlot;
    int minRamSpeed;
    int maxRamSpeed;
    int storageSlot;
    int vgaSlot;
    int price;
    DateTime createdAt;
    DateTime updatedAt;

    Motherboard({
        required this.id,
        required this.nama,
        required this.chipset,
        required this.imageUrl,
        required this.formFactor,
        required this.desc,
        required this.stok,
        required this.ramSlot,
        required this.minRamSpeed,
        required this.maxRamSpeed,
        required this.storageSlot,
        required this.vgaSlot,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Motherboard.fromJson(Map<String, dynamic> json) => Motherboard(
        id: json["id"],
        nama: json["nama"],
        chipset: json["chipset"],
        imageUrl: json["image_url"],
        formFactor: json["form_factor"],
        desc: json["desc"],
        stok: json["stok"],
        ramSlot: json["ram_slot"],
        minRamSpeed: json["min_ram_speed"],
        maxRamSpeed: json["max_ram_speed"],
        storageSlot: json["storage_slot"],
        vgaSlot: json["vga_slot"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "chipset": chipset,
        "image_url": imageUrl,
        "form_factor": formFactor,
        "desc": desc,
        "stok": stok,
        "ram_slot": ramSlot,
        "min_ram_speed": minRamSpeed,
        "max_ram_speed": maxRamSpeed,
        "storage_slot": storageSlot,
        "vga_slot": vgaSlot,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
