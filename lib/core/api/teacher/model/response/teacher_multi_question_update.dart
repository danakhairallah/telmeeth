import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_model.dart';

class ExamMultiQuestionUpdate {
  bool? success;
  String? message;
  MultiQuestionData? multiQuestionData;

  ExamMultiQuestionUpdate({this.success, this.message, this.multiQuestionData});

  ExamMultiQuestionUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    multiQuestionData = json['data'] != null ? new MultiQuestionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.multiQuestionData != null) {
      data['data'] = this.multiQuestionData!.toJson();
    }
    return data;
  }
}