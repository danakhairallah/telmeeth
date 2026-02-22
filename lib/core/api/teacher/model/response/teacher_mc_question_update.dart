// To parse this JSON data, do
//
//     final teacherMcQuestionUpdateModel = teacherMcQuestionUpdateModelFromJson(jsonString);

import 'dart:convert';

TeacherMcQuestionUpdateModel teacherMcQuestionUpdateModelFromJson(String str) => TeacherMcQuestionUpdateModel.fromJson(json.decode(str));

String teacherMcQuestionUpdateModelToJson(TeacherMcQuestionUpdateModel data) => json.encode(data.toJson());

class TeacherMcQuestionUpdateModel {
    bool? success;
    String? message;
    Data? data;

    TeacherMcQuestionUpdateModel({
        this.success,
        this.message,
        this.data,
    });

    factory TeacherMcQuestionUpdateModel.fromJson(Map<String, dynamic> json) => TeacherMcQuestionUpdateModel(
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
    int? taskId;
    String? question;
    List<String>? options;
    String? correctAnswer;
    String? mark;
    String? imageUrl;
    String? imagePath;
    DateTime? createdAt;
    DateTime? updatedAt;
    Task? task;

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
        this.task,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        taskId: json["task_id"],
        question: json["question"],
        options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
        correctAnswer: json["correct_answer"],
        mark: json["mark"],
        imageUrl: json["image_url"],
        imagePath: json["image_path"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        task: json["task"] == null ? null : Task.fromJson(json["task"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task_id": taskId,
        "question": question,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "correct_answer": correctAnswer,
        "mark": mark,
        "image_url": imageUrl,
        "image_path": imagePath,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "task": task?.toJson(),
    };
}

class Task {
    int? id;
    int? classTeacherId;
    int? lessonId;
    String? type;
    String? title;
    String? description;
    DateTime? deadline;
    int? mark;
    DateTime? createdAt;
    DateTime? updatedAt;

    Task({
        this.id,
        this.classTeacherId,
        this.lessonId,
        this.type,
        this.title,
        this.description,
        this.deadline,
        this.mark,
        this.createdAt,
        this.updatedAt,
    });

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        classTeacherId: json["class_teacher_id"],
        lessonId: json["lesson_id"],
        type: json["type"],
        title: json["title"],
        description: json["description"],
        deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        mark: json["mark"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_teacher_id": classTeacherId,
        "lesson_id": lessonId,
        "type": type,
        "title": title,
        "description": description,
        "deadline": deadline?.toIso8601String(),
        "mark": mark,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
