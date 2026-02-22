
import 'dart:convert';

TeacherClassesByGradeModel teacherClassesModelFromJson(String str) => TeacherClassesByGradeModel.fromJson(json.decode(str));

String teacherClassesModelToJson(TeacherClassesByGradeModel data) => json.encode(data.toJson());

class TeacherClassesByGradeModel {
    bool? success;
    Class? teacherClassesModelClass;

    TeacherClassesByGradeModel({
        this.success,
        this.teacherClassesModelClass,
    });

    factory TeacherClassesByGradeModel.fromJson(Map<String, dynamic> json) => TeacherClassesByGradeModel(
        success: json["success"],
        teacherClassesModelClass: json["class"] == null ? null : Class.fromJson(json["class"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "class": teacherClassesModelClass?.toJson(),
    };
}

class Class {
    int? id;
    int? curriculumId;
    int? gradeId;
    int? subjectId;
    dynamic imagePath;
    dynamic imageUrl;
    DateTime? createdAt;
    DateTime? updatedAt;

    Class({
        this.id,
        this.curriculumId,
        this.gradeId,
        this.subjectId,
        this.imagePath,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
    });

    factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"],
        curriculumId: json["curriculum_id"],
        gradeId: json["grade_id"],
        subjectId: json["subject_id"],
        imagePath: json["image_path"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "curriculum_id": curriculumId,
        "grade_id": gradeId,
        "subject_id": subjectId,
        "image_path": imagePath,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
