import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/response/section_teacher_model.dart';

class SectionTeacherService {
  Dio? dio;

  Future<SectionTeacherModel?> getSections(int gradeId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/sections-teacher/$gradeId");

      if (response.statusCode == 200) {
        return SectionTeacherModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get section: $e");
    }
    return null;
  }
}