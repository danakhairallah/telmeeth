import 'package:telmeeth/core/api/teacher/model/response/worksheet_essay_question_model.dart';

class WorksheetEssayQuestionPost {
  bool? success;
  String? message;
  WorksheetEssayData? worksheetEssayData;

  WorksheetEssayQuestionPost({this.success, this.message, this.worksheetEssayData});

  WorksheetEssayQuestionPost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    worksheetEssayData = json['data'] != null ? new WorksheetEssayData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.worksheetEssayData != null) {
      data['data'] = this.worksheetEssayData!.toJson();
    }
    return data;
  }
}