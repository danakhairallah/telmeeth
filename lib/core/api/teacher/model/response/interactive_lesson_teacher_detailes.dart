import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_model.dart';

class InteractiveLessonTeacherDetails {
	bool? success;
	InteractiveDataT? data;

	InteractiveLessonTeacherDetails({this.success, this.data});

	InteractiveLessonTeacherDetails.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		data = json['data'] != null ? new InteractiveDataT.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
		return data;
	}
}