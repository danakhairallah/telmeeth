import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_model.dart';

class InteractivePartsUpdate {
  bool? status;
  String? message;
  InteractivePartsData? data;

  InteractivePartsUpdate({this.status, this.message, this.data});

  InteractivePartsUpdate.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new InteractivePartsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}