class ClassesTeacherPost {
  bool? success;
  String? message;
  CData? cData;

  ClassesTeacherPost({this.success, this.message, this.cData});

  ClassesTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    cData = json['data'] != null ? new CData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.cData != null) {
      data['data'] = this.cData!.toJson();
    }
    return data;
  }
}

class CData {
  int? classId;
  int? sectionId;
  String? day;
  String? classTime;
  int? teacherId;
  String? updatedAt;
  String? createdAt;
  int? id;

  CData(
      {this.classId,
      this.sectionId,
      this.day,
      this.classTime,
      this.teacherId,
      this.updatedAt,
      this.createdAt,
      this.id});

  CData.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    sectionId = json['section_id'];
    day = json['day'];
    classTime = json['class_time'];
    teacherId = json['teacher_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_id'] = this.classId;
    data['section_id'] = this.sectionId;
    data['day'] = this.day;
    data['class_time'] = this.classTime;
    data['teacher_id'] = this.teacherId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}