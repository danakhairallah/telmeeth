import 'package:telmeeth/core/api/teacher/model/response/behavior_teacher_post.dart';

class BehaviorTeacherUpdate {
  bool? success;
  BehaviorData? behaviorData;
  bool? certificate;

  BehaviorTeacherUpdate({this.success, this.behaviorData, this.certificate});

  BehaviorTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    behaviorData = json['data'] != null ? new BehaviorData.fromJson(json['data']) : null;
    certificate = json['certificate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.behaviorData != null) {
      data['data'] = this.behaviorData!.toJson();
    }
    data['certificate'] = this.certificate;
    return data;
  }
}