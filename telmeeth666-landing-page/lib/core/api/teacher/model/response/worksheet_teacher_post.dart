class WorksheetTeacherPost {
  bool? success;
  String? message;
  WorksheetDataD? worksheetDataD;

  WorksheetTeacherPost({this.success, this.message, this.worksheetDataD});

  WorksheetTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    worksheetDataD = json['data'] != null ? new WorksheetDataD.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.worksheetDataD != null) {
      data['data'] = this.worksheetDataD!.toJson();
    }
    return data;
  }
}

class WorksheetDataD {
  int? teacherId;
  String? title;
  String? type;
  String? unitId;
  String? lessonId;
  String? updatedAt;
  String? createdAt;
  int? id;

  WorksheetDataD(
      {this.teacherId,
      this.title,
      this.type,
      this.unitId,
      this.lessonId,
      this.updatedAt,
      this.createdAt,
      this.id});

  WorksheetDataD.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    title = json['title'];
    type = json['type'];
    unitId = json['unit_id'];
    lessonId = json['lesson_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacher_id'] = this.teacherId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['unit_id'] = this.unitId;
    data['lesson_id'] = this.lessonId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}