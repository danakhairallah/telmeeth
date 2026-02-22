// To parse this JSON data, do
//
//     final secondTicketModel = secondTicketModelFromJson(jsonString);

import 'dart:convert';

SecondTicketModel secondTicketModelFromJson(String str) => SecondTicketModel.fromJson(json.decode(str));

String secondTicketModelToJson(SecondTicketModel data) => json.encode(data.toJson());

class SecondTicketModel {
    SecondTicket? secondTicket;
    Guard? student;
    Gate? gate;
    Guard? guard;

    SecondTicketModel({
        this.secondTicket,
        this.student,
        this.gate,
        this.guard,
    });

    factory SecondTicketModel.fromJson(Map<String, dynamic> json) => SecondTicketModel(
        secondTicket: json["second_ticket"] == null ? null : SecondTicket.fromJson(json["second_ticket"]),
        student: json["student"] == null ? null : Guard.fromJson(json["student"]),
        gate: json["gate"] == null ? null : Gate.fromJson(json["gate"]),
        guard: json["guard"] == null ? null : Guard.fromJson(json["guard"]),
    );

    Map<String, dynamic> toJson() => {
        "second_ticket": secondTicket?.toJson(),
        "student": student?.toJson(),
        "gate": gate?.toJson(),
        "guard": guard?.toJson(),
    };
}

class Gate {
    int? id;
    int? branchId;
    int? guardId;
    String? gate;
    DateTime? createdAt;
    DateTime? updatedAt;
    Guard? guardUser;

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
        guardUser: json["guard_user"] == null ? null : Guard.fromJson(json["guard_user"]),
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

class Guard {
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
    String? aiName;
    dynamic imagePath;
    dynamic imageUrl;
    int? branchId;
    List<String>? types;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? transportation;
    int? parentId;
    int? gradeSectionId;

    Guard({
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
        this.transportation,
        this.parentId,
        this.gradeSectionId,
    });

    factory Guard.fromJson(Map<String, dynamic> json) => Guard(
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
        transportation: json["transportation"],
        parentId: json["parent_id"],
        gradeSectionId: json["grade_section_id"],
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
        "birth_date": birthDate?.toIso8601String(),
        "address": address,
        "email": email,
        "ai_name": aiName,
        "image_path": imagePath,
        "image_url": imageUrl,
        "branch_id": branchId,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "transportation": transportation,
        "parent_id": parentId,
        "grade_section_id": gradeSectionId,
    };
}

class SecondTicket {
    int? studentId;
    String? gateId;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    SecondTicket({
        this.studentId,
        this.gateId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory SecondTicket.fromJson(Map<String, dynamic> json) => SecondTicket(
        studentId: json["student_id"],
        gateId: json["gate_id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "gate_id": gateId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
