
import 'package:telmeeth/core/api/student/model/response/attendance_data.dart';

class AttendanceModel {
  bool? success;
  AttendanceData? data;

  AttendanceModel({this.success, this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? AttendanceData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}