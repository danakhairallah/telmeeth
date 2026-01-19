import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_post.dart';

class WorksheetTeacherUpdate {
  bool? success;
  String? message;
  WorksheetDataD? worksheetDataD;

  WorksheetTeacherUpdate({this.success, this.message, this.worksheetDataD});

  WorksheetTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    worksheetDataD = json['data'] != null ? new WorksheetDataD.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.worksheetDataD != null) {
      data['data'] = this.worksheetDataD!.toJson();
    }
    return data;
  }
}