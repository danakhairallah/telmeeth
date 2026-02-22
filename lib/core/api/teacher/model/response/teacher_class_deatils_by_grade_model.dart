// To parse this JSON data, do
//
//     final teacherClassByGradeModel = teacherClassByGradeModelFromJson(jsonString);

import 'dart:convert';

TeacherClassDeatilsByGradeModel teacherClassByGradeModelFromJson(String str) => TeacherClassDeatilsByGradeModel.fromJson(json.decode(str));

String teacherClassByGradeModelToJson(TeacherClassDeatilsByGradeModel data) => json.encode(data.toJson());

class TeacherClassDeatilsByGradeModel {
    bool? success;
    int? classTeacherId;
    Data? data;

    TeacherClassDeatilsByGradeModel({
        this.success,
        this.classTeacherId,
        this.data,
    });

    factory TeacherClassDeatilsByGradeModel.fromJson(Map<String, dynamic> json) => TeacherClassDeatilsByGradeModel(
        success: json["success"],
        classTeacherId: json["class_teacher_id"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "class_teacher_id": classTeacherId,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? classId;
    int? teacherId;
    int? sectionId;
    String? day;
    String? classTime;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.classId,
        this.teacherId,
        this.sectionId,
        this.day,
        this.classTime,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        classId: json["class_id"],
        teacherId: json["teacher_id"],
        sectionId: json["section_id"],
        day: json["day"],
        classTime: json["class_time"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_id": classId,
        "teacher_id": teacherId,
        "section_id": sectionId,
        "day": day,
        "class_time": classTime,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
