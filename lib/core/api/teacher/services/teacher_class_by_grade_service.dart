import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_class_deatils_by_grade_model.dart';
import '../model/response/teacher_class_model_by_grade.dart';

class TeacherClassByGradeService {
  Dio? dio;

  Future<TeacherClassesByGradeModel?> getTeacherClassesByGrade(int gradeId , int subjectId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        "/api/teacher/class/$gradeId/$subjectId",
      );

      if (response.statusCode == 200) {
        return TeacherClassesByGradeModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Classes By Grade Error: $e");
      return null;
    }
  }
  Future<TeacherClassDeatilsByGradeModel?> getTeacherClassDeatilsByGrade(int gradeId , int sectionId , int subjectId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        "/api/teacher/class-teacher/$gradeId/$sectionId/$subjectId",
      );

      if (response.statusCode == 200) {
        return TeacherClassDeatilsByGradeModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Get Teacher Classes By Grade Error: $e");
      return null;
    }
  }
}