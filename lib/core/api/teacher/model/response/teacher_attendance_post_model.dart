// To parse this JSON data, do
//
//     final teacherAttendanceModel = teacherAttendanceModelFromJson(jsonString);

import 'dart:convert';

TeacherAttendancePostModel teacherAttendanceModelFromJson(String str) => TeacherAttendancePostModel.fromJson(json.decode(str));

String teacherAttendanceModelToJson(TeacherAttendancePostModel data) => json.encode(data.toJson());

class TeacherAttendancePostModel {
    String? message;
    Data? data;

    TeacherAttendancePostModel({
        this.message,
        this.data,
    });

    factory TeacherAttendancePostModel.fromJson(Map<String, dynamic> json) => TeacherAttendancePostModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? classTeacherId;
    bool? attendance;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.classTeacherId,
        this.attendance,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        classTeacherId: json["class_teacher_id"],
        attendance: json["attendance"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "class_teacher_id": classTeacherId,
        "attendance": attendance,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
