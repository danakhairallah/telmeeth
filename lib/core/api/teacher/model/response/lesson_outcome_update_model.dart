// To parse this JSON data, do
//
//     final lessonOutComeUpdateModel = lessonOutComeUpdateModelFromJson(jsonString);

import 'dart:convert';

LessonOutComeUpdateModel lessonOutComeUpdateModelFromJson(String str) => LessonOutComeUpdateModel.fromJson(json.decode(str));

String lessonOutComeUpdateModelToJson(LessonOutComeUpdateModel data) => json.encode(data.toJson());

class LessonOutComeUpdateModel {
    bool? success;
    String? message;
    Data? data;

    LessonOutComeUpdateModel({
        this.success,
        this.message,
        this.data,
    });

    factory LessonOutComeUpdateModel.fromJson(Map<String, dynamic> json) => LessonOutComeUpdateModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? lessonId;
    int? teacherId;
    String? text;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.lessonId,
        this.teacherId,
        this.text,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        lessonId: json["lesson_id"],
        teacherId: json["teacher_id"],
        text: json["text"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_id": lessonId,
        "teacher_id": teacherId,
        "text": text,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
