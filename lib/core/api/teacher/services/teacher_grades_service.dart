import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/response/list_grades_teacher_model.dart';
import '../model/response/teacher_grades_model.dart';

class TeacherGradesService {
  Dio? dio;

  Future<TeacherGradesModel?> getTeacherGrades() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/grades");

      if (response.statusCode == 200) {
        return TeacherGradesModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get Teacher Grades: $e");
    }
    return null;
  }
  Future<ListGradesTeacherModel?> getListTeacherGrades() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/grades-teacher");

      if (response.statusCode == 200) {
        return ListGradesTeacherModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get List Teacher Grades: $e");
    }
    return null;
  }

}