import 'package:telmeeth/core/api/teacher/model/response/profile_teacher_model.dart';

class ProfileTeacherUpdateModel {
  bool? success;
  String? message;
  TeacherProfile? teacherProfile;

  ProfileTeacherUpdateModel({this.success, this.message, this.teacherProfile});

  ProfileTeacherUpdateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    teacherProfile = json['data'] != null ? new TeacherProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.teacherProfile != null) {
      data['data'] = this.teacherProfile!.toJson();
    }
    return data;
  }
}