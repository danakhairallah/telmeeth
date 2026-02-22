import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_model.dart';

class InteractivePartsDetails {
  bool? status;
  InteractivePartsData? data;

  InteractivePartsDetails({this.status, this.data});

  InteractivePartsDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new InteractivePartsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}