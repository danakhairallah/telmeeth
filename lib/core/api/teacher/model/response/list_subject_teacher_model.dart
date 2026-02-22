// To parse this JSON data, do
//
//     final listSubjectTeacherModel = listSubjectTeacherModelFromJson(jsonString);

import 'dart:convert';

ListSubjectTeacherModel listSubjectTeacherModelFromJson(String str) => ListSubjectTeacherModel.fromJson(json.decode(str));

String listSubjectTeacherModelToJson(ListSubjectTeacherModel data) => json.encode(data.toJson());

class ListSubjectTeacherModel {
    bool? success;
    List<Subject>? subjects;

    ListSubjectTeacherModel({
        this.success,
        this.subjects,
    });

    factory ListSubjectTeacherModel.fromJson(Map<String, dynamic> json) => ListSubjectTeacherModel(
        success: json["success"],
        subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    int? id;
    String? nameAr;
    String? nameEn;
    DateTime? createdAt;
    DateTime? updatedAt;

    Subject({
        this.id,
        this.nameAr,
        this.nameEn,
        this.createdAt,
        this.updatedAt,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
