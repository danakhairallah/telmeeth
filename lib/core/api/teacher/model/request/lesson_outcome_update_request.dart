// To parse this JSON data, do
//
//     final lessonOutComeUpdateRequest = lessonOutComeUpdateRequestFromJson(jsonString);

import 'dart:convert';

LessonOutComeUpdateRequest lessonOutComeUpdateRequestFromJson(String str) => LessonOutComeUpdateRequest.fromJson(json.decode(str));

String lessonOutComeUpdateRequestToJson(LessonOutComeUpdateRequest data) => json.encode(data.toJson());

class LessonOutComeUpdateRequest {
    String? text;

    LessonOutComeUpdateRequest({
        this.text,
    });

    factory LessonOutComeUpdateRequest.fromJson(Map<String, dynamic> json) => LessonOutComeUpdateRequest(
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
    };
}
