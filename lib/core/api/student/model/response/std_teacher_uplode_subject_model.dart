// To parse this JSON data, do
//
//     final stdTeacherUplodeSubjectModel = stdTeacherUplodeSubjectModelFromJson(jsonString);

import 'dart:convert';

StdTeacherUplodeSubjectModel stdTeacherUplodeSubjectModelFromJson(String str) => StdTeacherUplodeSubjectModel.fromJson(json.decode(str));

String stdTeacherUplodeSubjectModelToJson(StdTeacherUplodeSubjectModel data) => json.encode(data.toJson());

class StdTeacherUplodeSubjectModel {
    bool? success;
    String? message;
    List<Datum>? data;

    StdTeacherUplodeSubjectModel({
        this.success,
        this.message,
        this.data,
    });

    factory StdTeacherUplodeSubjectModel.fromJson(Map<String, dynamic> json) => StdTeacherUplodeSubjectModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? teacherId;
    String? type;
    String? title;
    String? description;
    String? filePath;
    String? fileUrl;
    String? unitId;
    String? lessonId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
        this.id,
        this.teacherId,
        this.type,
        this.title,
        this.description,
        this.filePath,
        this.fileUrl,
        this.unitId,
        this.lessonId,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        teacherId: json["teacher_id"],
        type: json["type"],
        title: json["title"],
        description: json["description"],
        filePath: json["file_path"],
        fileUrl: json["file_url"],
        unitId: json["unit_id"],
        lessonId: json["lesson_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "teacher_id": teacherId,
        "type": type,
        "title": title,
        "description": description,
        "file_path": filePath,
        "file_url": fileUrl,
        "unit_id": unitId,
        "lesson_id": lessonId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
