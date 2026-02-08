import 'package:telmeeth/core/api/teacher/model/response/exam_question_teacher_model.dart';

class ExamQuestionPost {
  bool? success;
  String? message;
  ExamDataT? examDataT;

  ExamQuestionPost({this.success, this.message, this.examDataT});

  ExamQuestionPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    examDataT = json['data'] != null ? new ExamDataT.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.examDataT != null) {
      data['data'] = this.examDataT!.toJson();
    }
    return data;
  }
}