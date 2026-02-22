// To parse this JSON data, do
//
//     final studentUplodeSubjectModel = studentUplodeSubjectModelFromJson(jsonString);

import 'dart:convert';

StudentUplodeSubjectModel studentUplodeSubjectModelFromJson(String str) => StudentUplodeSubjectModel.fromJson(json.decode(str));

String studentUplodeSubjectModelToJson(StudentUplodeSubjectModel data) => json.encode(data.toJson());

class StudentUplodeSubjectModel {
    bool? success;
    String? message;
    List<Datum>? data;

    StudentUplodeSubjectModel({
        this.success,
        this.message,
        this.data,
    });

    factory StudentUplodeSubjectModel.fromJson(Map<String, dynamic> json) => StudentUplodeSubjectModel(
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
    String? type;
    String? title;
    String? description;
    String? filePath;
    String? fileUrl;
    String? unitId;
    String? lessonId;
    dynamic createdAt;
    dynamic updatedAt;

    Datum({
        this.id,
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
        type: json["type"],
        title: json["title"],
        description: json["description"],
        filePath: json["file_path"],
        fileUrl: json["file_url"],
        unitId: json["unit_id"],
        lessonId: json["lesson_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title,
        "description": description,
        "file_path": filePath,
        "file_url": fileUrl,
        "unit_id": unitId,
        "lesson_id": lessonId,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
