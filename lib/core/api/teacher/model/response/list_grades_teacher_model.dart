// To parse this JSON data, do
//
//     final listGradesTeacherModel = listGradesTeacherModelFromJson(jsonString);

import 'dart:convert';

ListGradesTeacherModel listGradesTeacherModelFromJson(String str) => ListGradesTeacherModel.fromJson(json.decode(str));

String listGradesTeacherModelToJson(ListGradesTeacherModel data) => json.encode(data.toJson());

class ListGradesTeacherModel {
    bool? success;
    List<Grade>? grades;

    ListGradesTeacherModel({
        this.success,
        this.grades,
    });

    factory ListGradesTeacherModel.fromJson(Map<String, dynamic> json) => ListGradesTeacherModel(
        success: json["success"],
        grades: json["grades"] == null ? [] : List<Grade>.from(json["grades"]!.map((x) => Grade.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "grades": grades == null ? [] : List<dynamic>.from(grades!.map((x) => x.toJson())),
    };
}

class Grade {
    int? id;
    String? nameAr;
    String? nameEn;
    String? level;
    DateTime? createdAt;
    DateTime? updatedAt;

    Grade({
        this.id,
        this.nameAr,
        this.nameEn,
        this.level,
        this.createdAt,
        this.updatedAt,
    });

    factory Grade.fromJson(Map<String, dynamic> json) => Grade(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        level: json["level"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "level": level,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
