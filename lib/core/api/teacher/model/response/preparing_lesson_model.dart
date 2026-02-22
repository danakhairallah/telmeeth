// To parse this JSON data, do
//
//     final preparingLessonModel = preparingLessonModelFromJson(jsonString);

import 'dart:convert';

PreparingLessonModel preparingLessonModelFromJson(String str) => PreparingLessonModel.fromJson(json.decode(str));

String preparingLessonModelToJson(PreparingLessonModel data) => json.encode(data.toJson());

class PreparingLessonModel {
    String? status;
    List<Record>? records;

    PreparingLessonModel({
        this.status,
        this.records,
    });

    factory PreparingLessonModel.fromJson(Map<String, dynamic> json) => PreparingLessonModel(
        status: json["status"],
        records: json["records"] == null ? [] : List<Record>.from(json["records"]!.map((x) => Record.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "records": records == null ? [] : List<dynamic>.from(records!.map((x) => x.toJson())),
    };
}

class Record {
    int? id;
    String? title;
    String? lessonTitle;
    String? objectives;
    String? studentLevel;
    String? duration;
    String? method;
    String? expectedMistakes;
    String? createdAt;

    Record({
        this.id,
        this.title,
        this.lessonTitle,
        this.objectives,
        this.studentLevel,
        this.duration,
        this.method,
        this.expectedMistakes,
        this.createdAt,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        title: json["title"],
        lessonTitle: json["lesson_title"],
        objectives: json["objectives"],
        studentLevel: json["student_level"],
        duration: json["duration"],
        method: json["method"],
        expectedMistakes: json["expected_mistakes"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "lesson_title": lessonTitle,
        "objectives": objectives,
        "student_level": studentLevel,
        "duration": duration,
        "method": method,
        "expected_mistakes": expectedMistakes,
        "created_at": createdAt,
    };
}
