class SubjectModel {
  bool? status;
  String? student;
  List<Classes>? classes;

  SubjectModel({this.status, this.student, this.classes});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    student = json['student'];
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['student'] = student;
    if (classes != null) {
      data['classes'] = classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? classId;
  int? subjectId;
  String? subjectNameAr;
  String? subjectNameEn;
  Null imageUrl;
  String? teacherNameAr;
  String? teacherNameEn;

  Classes(
      {this.classId,
      this.subjectId,
      this.subjectNameAr,
      this.subjectNameEn,
      this.imageUrl,
      this.teacherNameAr,
      this.teacherNameEn});

  Classes.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    subjectId = json['subject_id'];
    subjectNameAr = json['subject_name_ar'];
    subjectNameEn = json['subject_name_en'];
    imageUrl = json['image_url'];
    teacherNameAr = json['teacher_name_ar'];
    teacherNameEn = json['teacher_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class_id'] = classId;
    data['subject_id'] = subjectId;
    data['subject_name_ar'] = subjectNameAr;
    data['subject_name_en'] = subjectNameEn;
    data['image_url'] = imageUrl;
    data['teacher_name_ar'] = teacherNameAr;
    data['teacher_name_en'] = teacherNameEn;
    return data;
  }
}