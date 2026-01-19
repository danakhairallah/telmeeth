class AttendanceTeacherPost {
  bool? success;
  String? message;
  DataTA? dataTA;

  AttendanceTeacherPost({this.success, this.message, this.dataTA});

  AttendanceTeacherPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    dataTA = json['data'] != null ? new DataTA.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.dataTA != null) {
      data['data'] = this.dataTA!.toJson();
    }
    return data;
  }
}

class DataTA {
  int? studentId;
  int? lessonId;
  String? date;
  bool? isExcused;
  String? notes;
  int? teacherId;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataTA(
      {this.studentId,
      this.lessonId,
      this.date,
      this.isExcused,
      this.notes,
      this.teacherId,
      this.updatedAt,
      this.createdAt,
      this.id});

  DataTA.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    lessonId = json['lesson_id'];
    date = json['date'];
    isExcused = json['is_excused'];
    notes = json['notes'];
    teacherId = json['teacher_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['lesson_id'] = this.lessonId;
    data['date'] = this.date;
    data['is_excused'] = this.isExcused;
    data['notes'] = this.notes;
    data['teacher_id'] = this.teacherId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}