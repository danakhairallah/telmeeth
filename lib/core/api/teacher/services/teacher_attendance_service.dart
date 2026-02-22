import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_attendance_request_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_attendance_get_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_attendance_post_model.dart';

class TeacherAttendanceService {
  Dio? dio;

  Future<TeacherAttendanceGetModel?> getTeacherAttendances() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/attendance");

      if (response.statusCode == 200) {
        return TeacherAttendanceGetModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Attendance Error: $e");
      return null;
    }
  }

  Future<TeacherAttendancePostModel?> addTeacherAttendance(TeacherAttendanceRequestModel request) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.post(
        "/teacher/attendance",
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return TeacherAttendancePostModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Post Teacher Attendance Error: $e");
      return null;
    }
  }
}