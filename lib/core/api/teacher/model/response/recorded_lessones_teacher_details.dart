import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_model.dart';

class RecordedLessonesTeacherDetails {
	bool? success;
	RecordedDataT? data;

	RecordedLessonesTeacherDetails({this.success, this.data});

	RecordedLessonesTeacherDetails.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		data = json['data'] != null ? new RecordedDataT.fromJson(json['data']) : null;
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