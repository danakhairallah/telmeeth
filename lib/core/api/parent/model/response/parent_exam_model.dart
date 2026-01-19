import 'package:telmeeth/core/api/student/model/response/exam_aq.dart';

class ParentExamModel {
  bool? success;
  Student? student;
  List<Data>? data;

  ParentExamModel({this.success, this.student, this.data});

  ParentExamModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Student {
  int? id;
  String? name;

  Student({this.id, this.name});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? subjectNameAr;
  String? teacherNameAr;
  String? type;
  String? dateTime;
  int? duration;
  int? mark;
  String? description;
  String? status;
  String? timeInfo;
  bool? submitted;
  Null? studentMark;
  List<Questions>? questions;

  Data(
      {this.id,
      this.title,
      this.subjectNameAr,
      this.teacherNameAr,
      this.type,
      this.dateTime,
      this.duration,
      this.mark,
      this.description,
      this.status,
      this.timeInfo,
      this.submitted,
      this.studentMark,
      this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subjectNameAr = json['subject_name_ar'];
    teacherNameAr = json['teacher_name_ar'];
    type = json['type'];
    dateTime = json['date_time'];
    duration = json['duration'];
    mark = json['mark'];
    description = json['description'];
    status = json['status'];
    timeInfo = json['time_info'];
    submitted = json['submitted'];
    studentMark = json['student_mark'];
    if (json['questions'] != null) {
  questions = <Questions>[];
  json['questions'].forEach((v) {
    questions!.add(Questions.fromJson(v));
  });
}


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subject_name_ar'] = this.subjectNameAr;
    data['teacher_name_ar'] = this.teacherNameAr;
    data['type'] = this.type;
    data['date_time'] = this.dateTime;
    data['duration'] = this.duration;
    data['mark'] = this.mark;
    data['description'] = this.description;
    data['status'] = this.status;
    data['time_info'] = this.timeInfo;
    data['submitted'] = this.submitted;
    data['student_mark'] = this.studentMark;
    if (questions != null) {
  data['questions'] = questions!.map((v) => v.toJson()).toList();
}

    return data;
  }
}