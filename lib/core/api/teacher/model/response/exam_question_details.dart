import 'package:telmeeth/core/api/teacher/model/response/exam_question_teacher_model.dart';

class ExamQuestionDetails {
  bool? success;
  ExamDataT? examDataT;

  ExamQuestionDetails({this.success, this.examDataT});

  ExamQuestionDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    examDataT = json['data'] != null ? new ExamDataT.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.examDataT != null) {
      data['data'] = this.examDataT!.toJson();
    }
    return data;
  }
}