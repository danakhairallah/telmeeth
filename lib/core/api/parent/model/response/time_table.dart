class TimeTableModel {
  bool? success;
  List<Data>? data;

  TimeTableModel({this.success, this.data});

  TimeTableModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? classTeacherId;
  int? sectionId;
  String? sectionNameAr;
  String? sectionNameEn;
  int? classId;
  int? gradeId;
  String? gradeNameAr;
  String? gradeNameEn;
  int? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  int? teacherId;
  String? teacherNameAr;
  String? teacherNameEn;
  String? day;
  String? classTime;

  Data(
      {this.classTeacherId,
      this.sectionId,
      this.sectionNameAr,
      this.sectionNameEn,
      this.classId,
      this.gradeId,
      this.gradeNameAr,
      this.gradeNameEn,
      this.subjectId,
      this.subjectNameAr,
      this.subjectNameEn,
      this.teacherId,
      this.teacherNameAr,
      this.teacherNameEn,
      this.day,
      this.classTime});

  Data.fromJson(Map<String, dynamic> json) {
    classTeacherId = json['class_teacher_id'];
    sectionId = json['section_id'];
    sectionNameAr = json['section_name_ar'];
    sectionNameEn = json['section_name_en'];
    classId = json['class_id'];
    gradeId = json['grade_id'];
    gradeNameAr = json['grade_name_ar'];
    gradeNameEn = json['grade_name_en'];
    subjectId = json['subject_id'];
    subjectNameAr = json['subject_name_ar'];
    subjectNameEn = json['subject_name_en'];
    teacherId = json['teacher_id'];
    teacherNameAr = json['teacher_name_ar'];
    teacherNameEn = json['teacher_name_en'];
    day = json['day'];
    classTime = json['class_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_teacher_id'] = this.classTeacherId;
    data['section_id'] = this.sectionId;
    data['section_name_ar'] = this.sectionNameAr;
    data['section_name_en'] = this.sectionNameEn;
    data['class_id'] = this.classId;
    data['grade_id'] = this.gradeId;
    data['grade_name_ar'] = this.gradeNameAr;
    data['grade_name_en'] = this.gradeNameEn;
    data['subject_id'] = this.subjectId;
    data['subject_name_ar'] = this.subjectNameAr;
    data['subject_name_en'] = this.subjectNameEn;
    data['teacher_id'] = this.teacherId;
    data['teacher_name_ar'] = this.teacherNameAr;
    data['teacher_name_en'] = this.teacherNameEn;
    data['day'] = this.day;
    data['class_time'] = this.classTime;
    return data;
  }
}