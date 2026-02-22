// To parse this JSON data, do
//
//     final sectionTeacherModel = sectionTeacherModelFromJson(jsonString);

import 'dart:convert';

SectionTeacherModel sectionTeacherModelFromJson(String str) => SectionTeacherModel.fromJson(json.decode(str));

String sectionTeacherModelToJson(SectionTeacherModel data) => json.encode(data.toJson());

class SectionTeacherModel {
    bool? success;
    List<Section>? sections;

    SectionTeacherModel({
        this.success,
        this.sections,
    });

    factory SectionTeacherModel.fromJson(Map<String, dynamic> json) => SectionTeacherModel(
        success: json["success"],
        sections: json["sections"] == null ? [] : List<Section>.from(json["sections"]!.map((x) => Section.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "sections": sections == null ? [] : List<dynamic>.from(sections!.map((x) => x.toJson())),
    };
}

class Section {
    int? id;
    String? nameAr;
    String? nameEn;
    DateTime? createdAt;
    DateTime? updatedAt;

    Section({
        this.id,
        this.nameAr,
        this.nameEn,
        this.createdAt,
        this.updatedAt,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
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
