import 'package:telmeeth/core/api/teacher/model/response/task_teacher_post.dart';

class TaskTeacherUpdate {
  bool? success;
  String? message;
  DataTaskPost? dataTaskPost;

  TaskTeacherUpdate({this.success, this.message, this.dataTaskPost});

  TaskTeacherUpdate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    dataTaskPost = json['data'] != null ? new DataTaskPost.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.dataTaskPost != null) {
      data['data'] = this.dataTaskPost!.toJson();
    }
    return data;
  }
}