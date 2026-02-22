import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_model.dart';

class ScheduleTeacherUpdate {
  bool? success;
  String? message;
  ScheduleData? scheduleData;

  ScheduleTeacherUpdate({this.success, this.message, this.scheduleData});

  ScheduleTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    scheduleData = json['data'] != null ? new ScheduleData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.scheduleData != null) {
      data['data'] = this.scheduleData!.toJson();
    }
    return data;
  }
}