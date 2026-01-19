import 'package:telmeeth/core/api/teacher/model/response/task_teacher_model.dart';

class TaskTeacherDetails {
	bool? success;
	TaskDataT? taskDataT;

	TaskTeacherDetails({this.success, this.taskDataT});

	TaskTeacherDetails.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		taskDataT = json['data'] != null ? new TaskDataT.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.taskDataT != null) {
      data['data'] = this.taskDataT!.toJson();
    }
		return data;
	}
}