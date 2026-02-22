// To parse this JSON data, do
//
//     final teacherMcQuestionDeleteModel = teacherMcQuestionDeleteModelFromJson(jsonString);

import 'dart:convert';

TeacherMcQuestionDeleteModel teacherMcQuestionDeleteModelFromJson(String str) => TeacherMcQuestionDeleteModel.fromJson(json.decode(str));

String teacherMcQuestionDeleteModelToJson(TeacherMcQuestionDeleteModel data) => json.encode(data.toJson());

class TeacherMcQuestionDeleteModel {
    bool? success;
    String? message;

    TeacherMcQuestionDeleteModel({
        this.success,
        this.message,
    });

    factory TeacherMcQuestionDeleteModel.fromJson(Map<String, dynamic> json) => TeacherMcQuestionDeleteModel(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
