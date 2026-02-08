import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_post.dart';

class UplodesTeacherUpdate {
  bool? success;
  String? message;
  UplodeDataT? uplodeDataT;

  UplodesTeacherUpdate({this.success, this.message, this.uplodeDataT});

  UplodesTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    uplodeDataT = json['data'] != null ? new UplodeDataT.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.uplodeDataT != null) {
      data['data'] = this.uplodeDataT!.toJson();
    }
    return data;
  }
}