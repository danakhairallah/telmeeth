// To parse this JSON data, do
//
//     final teacherAttendanceRequestModel = teacherAttendanceRequestModelFromJson(jsonString);

import 'dart:convert';

TeacherAttendanceRequestModel teacherAttendanceRequestModelFromJson(String str) => TeacherAttendanceRequestModel.fromJson(json.decode(str));

String teacherAttendanceRequestModelToJson(TeacherAttendanceRequestModel data) => json.encode(data.toJson());

class TeacherAttendanceRequestModel {
    int? classTeacherId;
    bool? attendance;

    TeacherAttendanceRequestModel({
        this.classTeacherId,
        this.attendance,
    });

    factory TeacherAttendanceRequestModel.fromJson(Map<String, dynamic> json) => TeacherAttendanceRequestModel(
        classTeacherId: json["class_teacher_id"],
        attendance: json["attendance"],
    );

    Map<String, dynamic> toJson() => {
        "class_teacher_id": classTeacherId,
        "attendance": attendance,
    };
}
