// To parse this JSON data, do
//
//     final lessonOutComeModel = lessonOutComeModelFromJson(jsonString);

import 'dart:convert';

List<LessonOutComeModel> lessonOutComeModelFromJson(String str) => List<LessonOutComeModel>.from(json.decode(str).map((x) => LessonOutComeModel.fromJson(x)));

String lessonOutComeModelToJson(List<LessonOutComeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonOutComeModel {
    int? id;
    int? lessonId;
    int? teacherId;
    String? text;
    DateTime? createdAt;
    DateTime? updatedAt;
    Lesson? lesson;

    LessonOutComeModel({
        this.id,
        this.lessonId,
        this.teacherId,
        this.text,
        this.createdAt,
        this.updatedAt,
        this.lesson,
    });

    factory LessonOutComeModel.fromJson(Map<String, dynamic> json) => LessonOutComeModel(
        id: json["id"],
        lessonId: json["lesson_id"],
        teacherId: json["teacher_id"],
        text: json["text"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        lesson: json["lesson"] == null ? null : Lesson.fromJson(json["lesson"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_id": lessonId,
        "teacher_id": teacherId,
        "text": text,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lesson": lesson?.toJson(),
    };
}

class Lesson {
    int? id;
    String? name;
    dynamic filePath;
    String? fileUrl;
    dynamic imagePath;
    dynamic imageUrl;
    String? summary;
    int? unitId;
    DateTime? createdAt;
    DateTime? updatedAt;
    Unit? unit;

    Lesson({
        this.id,
        this.name,
        this.filePath,
        this.fileUrl,
        this.imagePath,
        this.imageUrl,
        this.summary,
        this.unitId,
        this.createdAt,
        this.updatedAt,
        this.unit,
    });

    factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        name: json["name"],
        filePath: json["file_path"],
        fileUrl: json["file_url"],
        imagePath: json["image_path"],
        imageUrl: json["image_url"],
        summary: json["summary"],
        unitId: json["unit_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "file_path": filePath,
        "file_url": fileUrl,
        "image_path": imagePath,
        "image_url": imageUrl,
        "summary": summary,
        "unit_id": unitId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "unit": unit?.toJson(),
    };
}

class Unit {
    int? id;
    String? name;
    int? classId;
    String? semester;
    DateTime? createdAt;
    DateTime? updatedAt;
    Class? unitClass;

    Unit({
        this.id,
        this.name,
        this.classId,
        this.semester,
        this.createdAt,
        this.updatedAt,
        this.unitClass,
    });

    factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        classId: json["class_id"],
        semester: json["semester"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        unitClass: json["class"] == null ? null : Class.fromJson(json["class"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "class_id": classId,
        "semester": semester,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "class": unitClass?.toJson(),
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
    Grade? subject;
    Grade? grade;

    Class({
        this.id,
        this.curriculumId,
        this.gradeId,
        this.subjectId,
        this.imagePath,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
        this.subject,
        this.grade,
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
        subject: json["subject"] == null ? null : Grade.fromJson(json["subject"]),
        grade: json["grade"] == null ? null : Grade.fromJson(json["grade"]),
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
        "subject": subject?.toJson(),
        "grade": grade?.toJson(),
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
