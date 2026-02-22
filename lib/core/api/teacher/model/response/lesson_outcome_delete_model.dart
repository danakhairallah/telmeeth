// To parse this JSON data, do
//
//     final lessonOutComeDeleteModel = lessonOutComeDeleteModelFromJson(jsonString);

import 'dart:convert';

LessonOutComeDeleteModel lessonOutComeDeleteModelFromJson(String str) => LessonOutComeDeleteModel.fromJson(json.decode(str));

String lessonOutComeDeleteModelToJson(LessonOutComeDeleteModel data) => json.encode(data.toJson());

class LessonOutComeDeleteModel {
    bool? success;
    String? message;

    LessonOutComeDeleteModel({
        this.success,
        this.message,
    });

    factory LessonOutComeDeleteModel.fromJson(Map<String, dynamic> json) => LessonOutComeDeleteModel(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
