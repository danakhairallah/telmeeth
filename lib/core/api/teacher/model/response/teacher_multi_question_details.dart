import 'package:telmeeth/core/api/teacher/model/response/teacher_multi_question_model.dart';

class ExamMultiQuestionDetails {
  bool? success;
  MultiQuestionData? multiQuestionData;

  ExamMultiQuestionDetails({this.success, this.multiQuestionData});

  ExamMultiQuestionDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    multiQuestionData = json['data'] != null ? new MultiQuestionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.multiQuestionData != null) {
      data['data'] = this.multiQuestionData!.toJson();
    }
    return data;
  }
}