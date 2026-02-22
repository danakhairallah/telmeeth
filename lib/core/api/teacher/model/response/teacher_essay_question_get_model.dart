// To parse this JSON data, do
//
//     final teacherEassyQuestionGetModel = teacherEassyQuestionGetModelFromJson(jsonString);

import 'dart:convert';

TeacherEssayQuestionGetModel teacherEassyQuestionGetModelFromJson(String str) => TeacherEssayQuestionGetModel.fromJson(json.decode(str));

String teacherEassyQuestionGetModelToJson(TeacherEssayQuestionGetModel data) => json.encode(data.toJson());

class TeacherEssayQuestionGetModel {
    bool? success;
    List<Datum>? data;

    TeacherEssayQuestionGetModel({
        this.success,
        this.data,
    });

    factory TeacherEssayQuestionGetModel.fromJson(Map<String, dynamic> json) => TeacherEssayQuestionGetModel(
        success: json["success"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? taskId;
    String? question;
    String? hint;
    int? mark;
    dynamic imagePath;
    dynamic imageUrl;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
