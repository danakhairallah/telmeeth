import 'package:telmeeth/core/api/model/response/attendance_data.dart';

class AttendanceModel {
  bool? success;
  AttendanceData? data;

  AttendanceModel({this.success, this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new AttendanceData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}