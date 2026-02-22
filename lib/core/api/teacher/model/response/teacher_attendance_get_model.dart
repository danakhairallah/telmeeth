// To parse this JSON data, do
//
//     final teacherAttendanceGetModel = teacherAttendanceGetModelFromJson(jsonString);

import 'dart:convert';

TeacherAttendanceGetModel teacherAttendanceGetModelFromJson(String str) => TeacherAttendanceGetModel.fromJson(json.decode(str));

String teacherAttendanceGetModelToJson(TeacherAttendanceGetModel data) => json.encode(data.toJson());

class TeacherAttendanceGetModel {
    String? teacher;
    List<Attendance>? attendance;

    TeacherAttendanceGetModel({
        this.teacher,
        this.attendance,
    });

    factory TeacherAttendanceGetModel.fromJson(Map<String, dynamic> json) => TeacherAttendanceGetModel(
        teacher: json["teacher"],
        attendance: json["attendance"] == null ? [] : List<Attendance>.from(json["attendance"]!.map((x) => Attendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "teacher": teacher,
        "attendance": attendance == null ? [] : List<dynamic>.from(attendance!.map((x) => x.toJson())),
    };
}

class Attendance {
    int? id;
    int? attendance;
    String? day;
    String? classTime;
    int? className;
    String? gradeName;
    String? subjectName;
    String? sectionName;
    DateTime? createdAt;

    Attendance({
        this.id,
        this.attendance,
        this.day,
        this.classTime,
        this.className,
        this.gradeName,
        this.subjectName,
        this.sectionName,
        this.createdAt,
    });

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        attendance: json["attendance"],
        day: json["day"],
        classTime: json["class_time"],
        className: json["class_name"],
        gradeName: json["grade_name"],
        subjectName: json["subject_name"],
        sectionName: json["section_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attendance": attendance,
        "day": day,
        "class_time": classTime,
        "class_name": className,
        "grade_name": gradeName,
        "subject_name": subjectName,
        "section_name": sectionName,
        "created_at": createdAt?.toIso8601String(),
    };
}
