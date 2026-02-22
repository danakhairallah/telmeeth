
import 'package:telmeeth/core/api/student/model/response/classes.dart';

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
    classes = json['classes'] != null ? Classes.fromJson(json['classes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['class_id'] = classId;
    data['teacher_id'] = teacherId;
    data['section_id'] = sectionId;
    data['day'] = day;
    data['class_time'] = classTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (classes != null) {
      data['class'] = classes!.toJson();
    }
    return data;
  }
}