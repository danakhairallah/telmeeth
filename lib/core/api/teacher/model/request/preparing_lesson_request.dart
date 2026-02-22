// To parse this JSON data, do
//
//     final preparingLessonRequest = preparingLessonRequestFromJson(jsonString);

import 'dart:convert';

PreparingLessonRequest preparingLessonRequestFromJson(String str) => PreparingLessonRequest.fromJson(json.decode(str));

String preparingLessonRequestToJson(PreparingLessonRequest data) => json.encode(data.toJson());

class PreparingLessonRequest {
    int? lessonId;
    String? title;
    String? text;
    String? objectives;
    String? studentLevel;
    String? duration;
    String? method;
    String? expectedMistakes;

    PreparingLessonRequest({
        this.lessonId,
        this.title,
        this.text,
        this.objectives,
        this.studentLevel,
        this.duration,
        this.method,
        this.expectedMistakes,
    });

    factory PreparingLessonRequest.fromJson(Map<String, dynamic> json) => PreparingLessonRequest(
        lessonId: json["lesson_id"],
        title: json["title"],
        text: json["text"],
        objectives: json["objectives"],
        studentLevel: json["student_level"],
        duration: json["duration"],
        method: json["method"],
        expectedMistakes: json["expected_mistakes"],
    );

    Map<String, dynamic> toJson() => {
        "lesson_id": lessonId,
        "title": title,
        "text": text,
        "objectives": objectives,
        "student_level": studentLevel,
        "duration": duration,
        "method": method,
        "expected_mistakes": expectedMistakes,
    };
}
