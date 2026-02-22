// To parse this JSON data, do
//
//     final teacherMcQuestionPostModel = teacherMcQuestionPostModelFromJson(jsonString);

import 'dart:convert';

TeacherMcQuestionPostModel teacherMcQuestionPostModelFromJson(String str) => TeacherMcQuestionPostModel.fromJson(json.decode(str));

String teacherMcQuestionPostModelToJson(TeacherMcQuestionPostModel data) => json.encode(data.toJson());

class TeacherMcQuestionPostModel {
    bool? success;
    String? message;
    Data? data;

    TeacherMcQuestionPostModel({
        this.success,
        this.message,
        this.data,
    });

    factory TeacherMcQuestionPostModel.fromJson(Map<String, dynamic> json) => TeacherMcQuestionPostModel(
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
    List<String>? options;
    String? correctAnswer;
    String? mark;
    String? imageUrl;
    String? imagePath;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.taskId,
        this.question,
        this.options,
        this.correctAnswer,
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
        options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
        correctAnswer: json["correct_answer"],
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
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "correct_answer": correctAnswer,
        "mark": mark,
        "image_url": imageUrl,
        "image_path": imagePath,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
