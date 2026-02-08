import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_model.dart';

class WorksheetTeacherDetailes {
  bool? success;
  WorksheetDataT? worksheetDataT;

  WorksheetTeacherDetailes({this.success, this.worksheetDataT});

  WorksheetTeacherDetailes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    worksheetDataT = json['data'] != null ? new WorksheetDataT.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.worksheetDataT != null) {
      data['data'] = this.worksheetDataT!.toJson();
    }
    return data;
  }
}