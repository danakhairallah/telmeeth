import 'package:telmeeth/core/api/teacher/model/response/worksheet_multi_question_model.dart';

class WorksheetMultiQuestionUpdate {
  bool? success;
  String? message;
  WorksheetMultiData? worksheetMultiData;

  WorksheetMultiQuestionUpdate({this.success, this.message, this.worksheetMultiData});

  WorksheetMultiQuestionUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    worksheetMultiData = json['data'] != null ? new WorksheetMultiData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.worksheetMultiData != null) {
      data['data'] = this.worksheetMultiData!.toJson();
    }
    return data;
  }
}