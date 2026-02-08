import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_model.dart';

class ClassesTeacherDetailes {
	bool? success;
	ClassesData? classesData;

	ClassesTeacherDetailes({this.success, this.classesData});

	ClassesTeacherDetailes.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		classesData = json['data'] != null ? new ClassesData.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.classesData != null) {
      data['data'] = this.classesData!.toJson();
    }
		return data;
	}
}