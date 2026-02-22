// To parse this JSON data, do
//
//     final teacherMcQuestionGetModel = teacherMcQuestionGetModelFromJson(jsonString);

import 'dart:convert';

TeacherMcQuestionGetModel teacherMcQuestionGetModelFromJson(String str) => TeacherMcQuestionGetModel.fromJson(json.decode(str));

String teacherMcQuestionGetModelToJson(TeacherMcQuestionGetModel data) => json.encode(data.toJson());

class TeacherMcQuestionGetModel {
    bool? success;
    List<Datum>? data;

    TeacherMcQuestionGetModel({
        this.success,
        this.data,
    });

    factory TeacherMcQuestionGetModel.fromJson(Map<String, dynamic> json) => TeacherMcQuestionGetModel(
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
    Options? options;
    String? correctAnswer;
    int? mark;
    dynamic imageUrl;
    dynamic imagePath;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
