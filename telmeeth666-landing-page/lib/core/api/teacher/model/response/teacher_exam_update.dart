import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_post.dart';

class TeacherExamUpdate {
  bool? success;
  String? message;
  ExamDetails? examDetails;

  TeacherExamUpdate({this.success, this.message, this.examDetails});

  TeacherExamUpdate.fromJson(Map<String, dynamic> json) {
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