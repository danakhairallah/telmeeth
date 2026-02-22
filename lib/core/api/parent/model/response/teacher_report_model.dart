class TeacherReportModel {
  bool? success;
  List<Data>? data;

  TeacherReportModel({this.success, this.data});

  TeacherReportModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? text;
  List<String>? attachments;
  int? classTeacherId;
  int? classId;
  String? day;
  String? classTime;
  Teacher? teacher;
  Subject? subject;

  Data(
      {this.id,
      this.text,
      this.attachments,
      this.classTeacherId,
      this.classId,
      this.day,
      this.classTime,
      this.teacher,
      this.subject});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    attachments = json['attachments'] != null
        ? List<String>.from(json['attachments'])
        : [];    classTeacherId = json['class_teacher_id'];
    classId = json['class_id'];
    day = json['day'];
    classTime = json['class_time'];
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['attachments'] = this.attachments;
    data['class_teacher_id'] = this.classTeacherId;
    data['class_id'] = this.classId;
    data['day'] = this.day;
    data['class_time'] = this.classTime;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? nameAr;
  String? nameEn;
  String? email;
  Null? phone;
  Null? imageUrl;
  Null? specialization;
  String? gender;

  Teacher(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.email,
      this.phone,
      this.imageUrl,
      this.specialization,
      this.gender});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['image_url'];
    specialization = json['specialization'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image_url'] = this.imageUrl;
    data['specialization'] = this.specialization;
    data['gender'] = this.gender;
    return data;
  }
}

class Subject {
  int? id;
  String? nameAr;
  String? nameEn;
  Null? imageUrl;

  Subject({this.id, this.nameAr, this.nameEn, this.imageUrl});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['image_url'] = this.imageUrl;
    return data;
  }
}