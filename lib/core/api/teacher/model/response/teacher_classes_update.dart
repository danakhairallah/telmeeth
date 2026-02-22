import 'package:telmeeth/core/api/teacher/model/response/classes_teacher_post.dart';

class ClassesTeacherUpdate {
  bool? success;
  String? message;
  CData? cData;

  ClassesTeacherUpdate({this.success, this.message, this.cData});

  ClassesTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    cData = json['data'] != null ? new CData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.cData != null) {
      data['data'] = this.cData!.toJson();
    }
    return data;
  }
}