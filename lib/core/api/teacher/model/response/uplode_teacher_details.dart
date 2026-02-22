import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_model.dart';

class UplodesTeacherDetails {
  bool? success;
  UplodeData? uplodeData;

  UplodesTeacherDetails({this.success, this.uplodeData});

  UplodesTeacherDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    uplodeData = json['data'] != null ? new UplodeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.uplodeData != null) {
      data['data'] = this.uplodeData!.toJson();
    }
    return data;
  }
}