// To parse this JSON data, do
//
//     final lessonOutComePostRequest = lessonOutComePostRequestFromJson(jsonString);

import 'dart:convert';

LessonOutComePostRequest lessonOutComePostRequestFromJson(String str) => LessonOutComePostRequest.fromJson(json.decode(str));

String lessonOutComePostRequestToJson(LessonOutComePostRequest data) => json.encode(data.toJson());

class LessonOutComePostRequest {
    int? lessonId;
    String? text;

    LessonOutComePostRequest({
        this.lessonId,
        this.text,
    });

    factory LessonOutComePostRequest.fromJson(Map<String, dynamic> json) => LessonOutComePostRequest(
        lessonId: json["lesson_id"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "lesson_id": lessonId,
        "text": text,
    };
}
