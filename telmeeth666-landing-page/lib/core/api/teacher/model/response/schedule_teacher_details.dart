import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_model.dart';

class ScheduleTeacherDetails {
  bool? success;
  ScheduleData? scheduleData;

  ScheduleTeacherDetails({this.success, this.scheduleData});

  ScheduleTeacherDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    scheduleData = json['data'] != null ? new ScheduleData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.scheduleData != null) {
      data['data'] = this.scheduleData!.toJson();
    }
    return data;
  }
}