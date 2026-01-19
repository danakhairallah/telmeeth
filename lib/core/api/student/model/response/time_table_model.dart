class TimeTableModel {
  String? student;
  List<Data>? data;

  TimeTableModel({this.student, this.data});

  TimeTableModel.fromJson(Map<String, dynamic> json) {
    student = json['student'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student'] = student;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['class_time'] = classTime;
    data['teacher_name_ar'] = teacherNameAr;
    data['teacher_name_en'] = teacherNameEn;
    data['subject_id'] = subjectId;
    data['subject_name_ar'] = subjectNameAr;
    data['subject_name_en'] = subjectNameEn;
    return data;
  }
}