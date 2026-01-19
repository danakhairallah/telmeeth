import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_model.dart';

class InteractivePartsPost {
  bool? status;
  String? message;
  List<InteractivePartsData>? data;

  InteractivePartsPost({this.status, this.message, this.data});

  InteractivePartsPost.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <InteractivePartsData>[];
      json['data'].forEach((v) {
        data!.add(new InteractivePartsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
