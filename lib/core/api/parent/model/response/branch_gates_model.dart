// To parse this JSON data, do
//
//     final branchGatesModel = branchGatesModelFromJson(jsonString);

import 'dart:convert';

BranchGatesModel branchGatesModelFromJson(String str) => BranchGatesModel.fromJson(json.decode(str));

String branchGatesModelToJson(BranchGatesModel data) => json.encode(data.toJson());

class BranchGatesModel {
    int? branchId;
    List<Gate>? gates;

    BranchGatesModel({
        this.branchId,
        this.gates,
    });

    factory BranchGatesModel.fromJson(Map<String, dynamic> json) => BranchGatesModel(
        branchId: json["branch_id"],
        gates: json["gates"] == null ? [] : List<Gate>.from(json["gates"]!.map((x) => Gate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "gates": gates == null ? [] : List<dynamic>.from(gates!.map((x) => x.toJson())),
    };
}

class Gate {
    int? id;
    int? branchId;
    int? guardId;
    String? gate;
    DateTime? createdAt;
    DateTime? updatedAt;
    GuardUser? guardUser;

    Gate({
        this.id,
        this.branchId,
        this.guardId,
        this.gate,
        this.createdAt,
        this.updatedAt,
        this.guardUser,
    });

    factory Gate.fromJson(Map<String, dynamic> json) => Gate(
        id: json["id"],
        branchId: json["branch_id"],
        guardId: json["guard_id"],
        gate: json["gate"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        guardUser: json["guard_user"] == null ? null : GuardUser.fromJson(json["guard_user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "branch_id": branchId,
        "guard_id": guardId,
        "gate": gate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "guard_user": guardUser?.toJson(),
    };
}

class GuardUser {
    int? id;
    String? nameAr;
    String? nameEn;
    String? userName;
    String? gender;
    String? phoneNumber;
    String? nationality;
    String? password;
    DateTime? birthDate;
    String? address;
    String? email;
    dynamic aiName;
    dynamic imagePath;
    dynamic imageUrl;
    int? branchId;
    List<String>? types;
    DateTime? createdAt;
    DateTime? updatedAt;

    GuardUser({
        this.id,
        this.nameAr,
        this.nameEn,
        this.userName,
        this.gender,
        this.phoneNumber,
        this.nationality,
        this.password,
        this.birthDate,
        this.address,
        this.email,
        this.aiName,
        this.imagePath,
        this.imageUrl,
        this.branchId,
        this.types,
        this.createdAt,
        this.updatedAt,
    });

    factory GuardUser.fromJson(Map<String, dynamic> json) => GuardUser(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        userName: json["user_name"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        nationality: json["nationality"],
        password: json["password"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        address: json["address"],
        email: json["email"],
        aiName: json["ai_name"],
        imagePath: json["image_path"],
        imageUrl: json["image_url"],
        branchId: json["branch_id"],
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "user_name": userName,
        "gender": gender,
        "phone_number": phoneNumber,
        "nationality": nationality,
        "password": password,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "address": address,
        "email": email,
        "ai_name": aiName,
        "image_path": imagePath,
        "image_url": imageUrl,
        "branch_id": branchId,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
