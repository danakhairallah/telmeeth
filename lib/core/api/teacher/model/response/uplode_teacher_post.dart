class UplodesTeacherPost {
  bool? success;
  String? message;
  UplodeDataT? uplodeDataT;

  UplodesTeacherPost({this.success, this.message, this.uplodeDataT});

  UplodesTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    uplodeDataT = json['data'] != null ? new UplodeDataT.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.uplodeDataT != null) {
      data['data'] = this.uplodeDataT!.toJson();
    }
    return data;
  }
}

class UplodeDataT {
  int? teacherId;
  String? type;
  String? title;
  String? description;
  String? filePath;
  String? fileUrl;
  String? unitId;
  String? lessonId;
  String? updatedAt;
  String? createdAt;
  int? id;

  UplodeDataT(
      {this.teacherId,
      this.type,
      this.title,
      this.description,
      this.filePath,
      this.fileUrl,
      this.unitId,
      this.lessonId,
      this.updatedAt,
      this.createdAt,
      this.id});

  UplodeDataT.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    filePath = json['file_path'];
    fileUrl = json['file_url'];
    unitId = json['unit_id'];
    lessonId = json['lesson_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['file_path'] = this.filePath;
    data['file_url'] = this.fileUrl;
    data['unit_id'] = this.unitId;
    data['lesson_id'] = this.lessonId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}