
import 'package:telmeeth/core/api/student/model/response/task.dart';

class TaskListResponse {
  bool? status;
  List<Task>? data;

  TaskListResponse({required this.status, required this.data});

  factory TaskListResponse.fromJson(Map<String, dynamic> json) {
    return TaskListResponse(
      status: json['status'],
      data: (json['data'] as List).map((e) => Task.fromJson(e)).toList(),
    );
  }
}

