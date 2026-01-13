import 'package:telmeeth/core/api/model/response/classes.dart';

class ClassTeacher {
  int? id;
  int? classId;
  int? teacherId;
  int? sectionId;
  String? day;
  String? classTime;
  String? createdAt;
  String? updatedAt;
  Classes? classes;

  ClassTeacher({this.id, this.classId, this.teacherId, this.sectionId, this.day, this.classTime, this.createdAt, this.updatedAt, this.classes});

  ClassTeacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classId = json['class_id'];
    teacherId = json['teacher_id'];
    sectionId = json['section_id'];
    day = json['day'];
    classTime = json['class_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    classes = json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['class_id'] = this.classId;
    data['teacher_id'] = this.teacherId;
    data['section_id'] = this.sectionId;
    data['day'] = this.day;
    data['class_time'] = this.classTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.classes != null) {
      data['class'] = this.classes!.toJson();
    }
    return data;
  }
}