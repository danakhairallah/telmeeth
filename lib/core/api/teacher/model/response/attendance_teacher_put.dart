import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_post.dart' show DataTA;

class AttendanceTeacherPut {
  bool? success;
  String? message;
  DataTA? dataTA;

  AttendanceTeacherPut({this.success, this.message, this.dataTA});

  AttendanceTeacherPut.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    dataTA = json['data'] != null ? new DataTA.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.dataTA != null) {
      data['data'] = this.dataTA!.toJson();
    }
    return data;
  }
}