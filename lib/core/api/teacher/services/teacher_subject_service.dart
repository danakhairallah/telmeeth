import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/response/list_subject_teacher_model.dart';
import '../model/response/teacher_subject_model.dart';

class TeacherSubjectService {
  Dio? dio;

  Future<TeacherSubjectModel?> getTeacherSubject( int gradeId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/subjects/$gradeId");

      if (response.statusCode == 200) {
        return TeacherSubjectModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get Teacher Subject: $e");
    }
    return null;
  }
  Future<ListSubjectTeacherModel?> getTeacherListSubject( int gradeId , int sectionId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/subjects-teacher/$gradeId/$sectionId");

      if (response.statusCode == 200) {
        return ListSubjectTeacherModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get Teacher List Subject: $e");
    }
    return null;
  }
}