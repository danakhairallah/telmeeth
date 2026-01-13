class TimeTableModel {
  String? student;
  List<Data>? data;

  TimeTableModel({this.student, this.data});

  TimeTableModel.fromJson(Map<String, dynamic> json) {
    student = json['student'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student'] = this.student;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? day;
  String? classTime;
  String? teacherNameAr;
  String? teacherNameEn;
  int? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;

  Data(
      {this.id,
      this.day,
      this.classTime,
      this.teacherNameAr,
      this.teacherNameEn,
      this.subjectId,
      this.subjectNameAr,
      this.subjectNameEn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    classTime = json['class_time'];
    teacherNameAr = json['teacher_name_ar'];
    teacherNameEn = json['teacher_name_en'];
    subjectId = json['subject_id'];
    subjectNameAr = json['subject_name_ar'];
    subjectNameEn = json['subject_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['class_time'] = this.classTime;
    data['teacher_name_ar'] = this.teacherNameAr;
    data['teacher_name_en'] = this.teacherNameEn;
    data['subject_id'] = this.subjectId;
    data['subject_name_ar'] = this.subjectNameAr;
    data['subject_name_en'] = this.subjectNameEn;
    return data;
  }
}