// To parse this JSON data, do
//
//     final tasksModel = tasksModelFromJson(jsonString);

import 'dart:convert';

TasksModel tasksModelFromJson(String str) => TasksModel.fromJson(json.decode(str));

String tasksModelToJson(TasksModel data) => json.encode(data.toJson());

class TasksModel {
    bool? success;
    Student? student;
    List<Datum>? data;

    TasksModel({
        this.success,
        this.student,
        this.data,
    });

    factory TasksModel.fromJson(Map<String, dynamic> json) => TasksModel(
        success: json["success"],
        student: json["student"] == null ? null : Student.fromJson(json["student"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "student": student?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? title;
    String? type;
    String? description;
    DateTime? deadline;
    int? mark;
    String? subjectNameAr;
    String? subjectNameEn;
    String? teacherNameAr;
    String? teacherNameEn;
    String? status;
    double? daysLeft;
    bool? submitted;

    Datum({
        this.id,
        this.title,
        this.type,
        this.description,
        this.deadline,
        this.mark,
        this.subjectNameAr,
        this.subjectNameEn,
        this.teacherNameAr,
        this.teacherNameEn,
        this.status,
        this.daysLeft,
        this.submitted,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        description: json["description"],
        deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        mark: json["mark"],
        subjectNameAr: json["subject_name_ar"],
        subjectNameEn: json["subject_name_en"],
        teacherNameAr: json["teacher_name_ar"],
        teacherNameEn: json["teacher_name_en"],
        status: json["status"],
        daysLeft: json["days_left"]?.toDouble(),
        submitted: json["submitted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "description": description,
        "deadline": deadline?.toIso8601String(),
        "mark": mark,
        "subject_name_ar": subjectNameAr,
        "subject_name_en": subjectNameEn,
        "teacher_name_ar": teacherNameAr,
        "teacher_name_en": teacherNameEn,
        "status": status,
        "days_left": daysLeft,
        "submitted": submitted,
    };
}

class Student {
    int? id;
    String? name;

    Student({
        this.id,
        this.name,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
