import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_post.dart';

class InteractiveLessonTeacherUpdate {
  bool? success;
  String? message;
  InteractivePostData? data;

  InteractiveLessonTeacherUpdate({this.success, this.message, this.data});

  InteractiveLessonTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new InteractivePostData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}