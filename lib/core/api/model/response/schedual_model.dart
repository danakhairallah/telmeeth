import 'package:telmeeth/core/api/model/request/schrdual_request.dart';

class ScheduleModel {
  int id;
  int studentId;
  String day;
  String startTime;
  String endTime;
  String task;
  String description;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  ScheduleModel({
    required this.id,
    required this.studentId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.task,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  // تحويل ScheduleModel إلى SchedualRequest
  SchedualRequest toRequest() {
    return SchedualRequest(
      day: day,
      startTime: startTime,
      endTime: endTime,
      task: task,
      description: description,
      status: status,
    );
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      studentId: json['student_id'],
      day: json['day'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      task: json['task'],
      description: json['description'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "student_id": studentId,
      "day": day,
      "start_time": startTime,
      "end_time": endTime,
      "task": task,
      "description": description,
      "status": status,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }
}

