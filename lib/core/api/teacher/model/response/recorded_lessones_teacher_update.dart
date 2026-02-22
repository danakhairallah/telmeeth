import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_post.dart';

class RecordedLessonesTeacherUpdate {
  bool? success;
  String? message;
  DataRL? data;

  RecordedLessonesTeacherUpdate({this.success, this.message, this.data});

  RecordedLessonesTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataRL.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}