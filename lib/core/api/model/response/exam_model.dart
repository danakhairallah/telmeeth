import 'package:telmeeth/core/api/model/response/exam_data.dart';
import 'package:telmeeth/core/api/model/response/subject_model.dart';

class ExamModel {
  bool? status;
  List<Data>? data;

  ExamModel({this.status, this.data});

  ExamModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(new Data.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? classTeacherId;
  String? dateTime;
  int? mark;
  int? duration;
  String? title;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? status;
  ClassTeacher? classTeacher;

  Data({this.id, this.classTeacherId, this.dateTime, this.mark, this.duration, this.title, this.description, this.type, this.createdAt, this.updatedAt, this.status, this.classTeacher});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classTeacherId = json['class_teacher_id'];
    dateTime = json['date_time'];
    mark = json['mark'];
    duration = json['duration'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    classTeacher = json['class_teacher'] != null ? new ClassTeacher.fromJson(json['class_teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['class_teacher_id'] = this.classTeacherId;
    data['date_time'] = this.dateTime;
    data['mark'] = this.mark;
    data['duration'] = this.duration;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    if (this.classTeacher != null) {
      data['class_teacher'] = this.classTeacher!.toJson();
    }
    return data;
  }
}

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
    classes = json['class'] != null ? new Classes.fromJson(json['class']) : null;
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
