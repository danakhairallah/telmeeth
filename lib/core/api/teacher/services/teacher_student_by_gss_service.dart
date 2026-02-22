import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_student_by_gss_model.dart';

class TeacherStudentByGssService {
  Dio? dio;

  Future<TeacherStudentByGssModel?> getTeacherListStudent( int gradeId , int sectionId , int subjectId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/api/teacher/students/$gradeId/$sectionId/$subjectId");

      if (response.statusCode == 200) {
        return TeacherStudentByGssModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get Teacher List Student: $e");
    }
    return null;
  }
}