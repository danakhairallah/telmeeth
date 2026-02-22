// To parse this JSON data, do
//
//     final lessonOutComePostModel = lessonOutComePostModelFromJson(jsonString);

import 'dart:convert';

LessonOutComePostModel lessonOutComePostModelFromJson(String str) => LessonOutComePostModel.fromJson(json.decode(str));

String lessonOutComePostModelToJson(LessonOutComePostModel data) => json.encode(data.toJson());

class LessonOutComePostModel {
    bool? success;
    String? message;
    Data? data;

    LessonOutComePostModel({
        this.success,
        this.message,
        this.data,
    });

    factory LessonOutComePostModel.fromJson(Map<String, dynamic> json) => LessonOutComePostModel(
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
    int? lessonId;
    int? teacherId;
    String? text;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.lessonId,
        this.teacherId,
        this.text,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        lessonId: json["lesson_id"],
        teacherId: json["teacher_id"],
        text: json["text"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "lesson_id": lessonId,
        "teacher_id": teacherId,
        "text": text,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
