// To parse this JSON data, do
//
//     final teacherEassyQuestionPostModel = teacherEassyQuestionPostModelFromJson(jsonString);

import 'dart:convert';

TeacherEssayQuestionPostModel teacherEassyQuestionPostModelFromJson(String str) => TeacherEssayQuestionPostModel.fromJson(json.decode(str));

String teacherEassyQuestionPostModelToJson(TeacherEssayQuestionPostModel data) => json.encode(data.toJson());

class TeacherEssayQuestionPostModel {
    bool? success;
    String? message;
    Data? data;

    TeacherEssayQuestionPostModel({
        this.success,
        this.message,
        this.data,
    });

    factory TeacherEssayQuestionPostModel.fromJson(Map<String, dynamic> json) => TeacherEssayQuestionPostModel(
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
    int? taskId;
    String? question;
    String? hint;
    int? mark;
    dynamic imageUrl;
    dynamic imagePath;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.taskId,
        this.question,
        this.hint,
        this.mark,
        this.imageUrl,
        this.imagePath,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        taskId: json["task_id"],
        question: json["question"],
        hint: json["hint"],
        mark: json["mark"],
        imageUrl: json["image_url"],
        imagePath: json["image_path"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "question": question,
        "hint": hint,
        "mark": mark,
        "image_url": imageUrl,
        "image_path": imagePath,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
