// To parse this JSON data, do
//
//     final liveLessonFinshResponse = liveLessonFinshResponseFromJson(jsonString);

import 'dart:convert';

LiveLessonFinshResponse liveLessonFinshResponseFromJson(String str) => LiveLessonFinshResponse.fromJson(json.decode(str));

String liveLessonFinshResponseToJson(LiveLessonFinshResponse data) => json.encode(data.toJson());

class LiveLessonFinshResponse {
    bool? success;
    String? message;

    LiveLessonFinshResponse({
        this.success,
        this.message,
    });

    factory LiveLessonFinshResponse.fromJson(Map<String, dynamic> json) => LiveLessonFinshResponse(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
