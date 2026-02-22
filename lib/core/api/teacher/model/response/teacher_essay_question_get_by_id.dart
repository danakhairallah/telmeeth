// To parse this JSON data, do
//
//     final teacherEassyQuestionGetByIdModel = teacherEassyQuestionGetByIdModelFromJson(jsonString);

import 'dart:convert';

TeacherEssayQuestionGetByIdModel teacherEassyQuestionGetByIdModelFromJson(String str) => TeacherEssayQuestionGetByIdModel.fromJson(json.decode(str));

String teacherEassyQuestionGetByIdModelToJson(TeacherEssayQuestionGetByIdModel data) => json.encode(data.toJson());

class TeacherEssayQuestionGetByIdModel {
    bool? success;
    Data? data;

    TeacherEssayQuestionGetByIdModel.TeacherEssayQuestionGetByIdModel({
        this.success,
        this.data,
    });

    factory TeacherEssayQuestionGetByIdModel.fromJson(Map<String, dynamic> json) => TeacherEssayQuestionGetByIdModel.TeacherEssayQuestionGetByIdModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? taskId;
    String? question;
    String? hint;
    int? mark;
    dynamic imagePath;
    dynamic imageUrl;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.taskId,
        this.question,
        this.hint,
        this.mark,
        this.imagePath,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        taskId: json["task_id"],
        question: json["question"],
        hint: json["hint"],
        mark: json["mark"],
        imagePath: json["image_path"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task_id": taskId,
        "question": question,
        "hint": hint,
        "mark": mark,
        "image_path": imagePath,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
