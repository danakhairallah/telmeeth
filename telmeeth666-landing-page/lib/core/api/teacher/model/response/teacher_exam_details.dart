import 'package:telmeeth/core/api/student/model/response/exam_data.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_model.dart';

class TeacherExamDetails {
	bool? success;
	ExamDataT? examDataT;

	TeacherExamDetails({this.success, this.examDataT});

	TeacherExamDetails.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		examDataT = json['data'] != null ? new ExamDataT.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		if (this.examDataT != null) {
      data['data'] = this.examDataT!.toJson();
    }
		return data;
	}
}