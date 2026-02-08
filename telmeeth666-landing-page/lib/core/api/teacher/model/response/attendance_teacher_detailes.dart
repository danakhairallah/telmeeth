import 'package:telmeeth/core/api/teacher/model/response/attendance_teacher_model.dart';

class AttendanceTeacherDetails {
	bool? success;
	String? message;
	List<TeacherAttendanceData>? teacherAttendanceData;

	AttendanceTeacherDetails({this.success, this.message, this.teacherAttendanceData});

	AttendanceTeacherDetails.fromJson(Map<String, dynamic> json) {
		success = json['success'];
		message = json['message'];
		if (json['data'] != null) {
			teacherAttendanceData = <TeacherAttendanceData>[];
			json['data'].forEach((v) { teacherAttendanceData!.add(new TeacherAttendanceData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['success'] = this.success;
		data['message'] = this.message;
		if (this.teacherAttendanceData != null) {
      data['data'] = this.teacherAttendanceData!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}