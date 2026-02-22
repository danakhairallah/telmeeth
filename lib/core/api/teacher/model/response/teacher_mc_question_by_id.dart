// To parse this JSON data, do
//
//     final teacherMcQuestionGetByIdModel = teacherMcQuestionGetByIdModelFromJson(jsonString);

import 'dart:convert';

TeacherMcQuestionGetByIdModel teacherMcQuestionGetByIdModelFromJson(String str) => TeacherMcQuestionGetByIdModel.fromJson(json.decode(str));

String teacherMcQuestionGetByIdModelToJson(TeacherMcQuestionGetByIdModel data) => json.encode(data.toJson());

class TeacherMcQuestionGetByIdModel {
    bool? success;
    Data? data;

    TeacherMcQuestionGetByIdModel({
        this.success,
        this.data,
    });

    factory TeacherMcQuestionGetByIdModel.fromJson(Map<String, dynamic> json) => TeacherMcQuestionGetByIdModel(
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
    Options? options;
    String? correctAnswer;
    int? mark;
    dynamic imageUrl;
    dynamic imagePath;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.taskId,
        this.question,
        this.options,
        this.correctAnswer,
        this.mark,
        this.imageUrl,
        this.imagePath,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        taskId: json["task_id"],
        question: json["question"],
        options: json["options"] == null ? null : Options.fromJson(json["options"]),
        correctAnswer: json["correct_answer"],
        mark: json["mark"],
        imageUrl: json["image_url"],
        imagePath: json["image_path"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task_id": taskId,
        "question": question,
        "options": options?.toJson(),
        "correct_answer": correctAnswer,
        "mark": mark,
        "image_url": imageUrl,
        "image_path": imagePath,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Options {
    String? a;
    String? b;
    String? c;
    String? d;

    Options({
        this.a,
        this.b,
        this.c,
        this.d,
    });

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
    );

    Map<String, dynamic> toJson() => {
        "a": a,
        "b": b,
        "c": c,
        "d": d,
    };
}
