class TeacherExamPost {
  bool? success;
  String? message;
  ExamDetails? examDetails;

  TeacherExamPost({this.success, this.message, this.examDetails});

  TeacherExamPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    examDetails = json['data'] != null ? new ExamDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.examDetails != null) {
      data['data'] = this.examDetails!.toJson();
    }
    return data;
  }
}

class ExamDetails {
  int? classTeacherId;
  String? dateTime;
  int? mark;
  int? duration;
  String? title;
  String? description;
  String? type;
  String? updatedAt;
  String? createdAt;
  int? id;

  ExamDetails(
      {this.classTeacherId,
      this.dateTime,
      this.mark,
      this.duration,
      this.title,
      this.description,
      this.type,
      this.updatedAt,
      this.createdAt,
      this.id});

  ExamDetails.fromJson(Map<String, dynamic> json) {
    classTeacherId = json['class_teacher_id'];
    dateTime = json['date_time'];
    mark = json['mark'];
    duration = json['duration'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_teacher_id'] = this.classTeacherId;
    data['date_time'] = this.dateTime;
    data['mark'] = this.mark;
    data['duration'] = this.duration;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}