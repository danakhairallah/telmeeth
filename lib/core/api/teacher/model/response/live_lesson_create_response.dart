// To parse this JSON data, do
//
//     final liveLessonCreateResponse = liveLessonCreateResponseFromJson(jsonString);

import 'dart:convert';

LiveLessonCreateResponse liveLessonCreateResponseFromJson(String str) => LiveLessonCreateResponse.fromJson(json.decode(str));

String liveLessonCreateResponseToJson(LiveLessonCreateResponse data) => json.encode(data.toJson());

class LiveLessonCreateResponse {
    bool? success;
    String? message;
    Data? data;

    LiveLessonCreateResponse({
        this.success,
        this.message,
        this.data,
    });

    factory LiveLessonCreateResponse.fromJson(Map<String, dynamic> json) => LiveLessonCreateResponse(
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
    int? lessonId;
    int? teacherId;
    int? sectionId;
    String? title;
    DateTime? startTime;
    DateTime? endTime;
    String? room;
    dynamic videoUrl;
    String? description;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.lessonId,
        this.teacherId,
        this.sectionId,
        this.title,
        this.startTime,
        this.endTime,
        this.room,
        this.videoUrl,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        lessonId: json["lesson_id"],
        teacherId: json["teacher_id"],
        sectionId: json["section_id"],
        title: json["title"],
        startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
        endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
        room: json["room"],
        videoUrl: json["video_url"],
        description: json["description"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "lesson_id": lessonId,
        "teacher_id": teacherId,
        "section_id": sectionId,
        "title": title,
        "start_time": startTime?.toIso8601String(),
        "end_time": endTime?.toIso8601String(),
        "room": room,
        "video_url": videoUrl,
        "description": description,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
