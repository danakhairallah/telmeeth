// To parse this JSON data, do
//
//     final liveLessonCreateRequest = liveLessonCreateRequestFromJson(jsonString);

import 'dart:convert';

LiveLessonCreateRequest liveLessonCreateRequestFromJson(String str) => LiveLessonCreateRequest.fromJson(json.decode(str));

String liveLessonCreateRequestToJson(LiveLessonCreateRequest data) => json.encode(data.toJson());

class LiveLessonCreateRequest {
    int? lessonId;
    int? sectionId;
    String? title;
    DateTime? startTime;
    DateTime? endTime;
    String? room;
    String? description;

    LiveLessonCreateRequest({
        this.lessonId,
        this.sectionId,
        this.title,
        this.startTime,
        this.endTime,
        this.room,
        this.description,
    });

    factory LiveLessonCreateRequest.fromJson(Map<String, dynamic> json) => LiveLessonCreateRequest(
        lessonId: json["lesson_id"],
        sectionId: json["section_id"],
        title: json["title"],
        startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
        endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
        room: json["room"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "lesson_id": lessonId,
        "section_id": sectionId,
        "title": title,
        "start_time": startTime?.toIso8601String(),
        "end_time": endTime?.toIso8601String(),
        "room": room,
        "description": description,
    };
}
