import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/student_uplode_subject_model.dart';
import '../model/response/student_upload_model.dart';

class StudentUploadService {
  Future<List<StudentUploadModel>?> getUploadsByUnit(String unitId) async {
    try {
      final dio = await ApiClient.getDio();
      final response = await dio.get(
        "/student/uploads/unit/$unitId",
      );

      if (response.statusCode == 200 &&
          response.data is Map &&
          response.data['success'] == true &&
          response.data['data'] is List) {
        return (response.data['data'] as List)
            .map((e) => StudentUploadModel.fromJson(e))
            .toList();
      }
      return null;
    } catch (e) {
      print("StudentUploadService getUploadsByUnit error: $e");
      return null;
    }
  }

  Future<List<StudentUploadModel>?> getUploadsByLesson(String lessonId) async {
    try {
      final dio = await ApiClient.getDio();
      final response = await dio.get(
        "/student/uploads/lesson/$lessonId",
      );

      if (response.statusCode == 200 &&
          response.data is Map &&
          response.data['success'] == true &&
          response.data['data'] is List) {
        return (response.data['data'] as List)
            .map((e) => StudentUploadModel.fromJson(e))
            .toList();
      }
      return null;
    } catch (e) {
      print("StudentUploadService getUploadsByLesson error: $e");
      return null;
    }
  }
  Future<StudentUplodeSubjectModel?> getUnitById(int subjectId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/student/uploads/subject/$subjectId");

      print("Full response: ${response.data}");

      if (response.statusCode == 200) {
        if (response.statusCode == 200) {
          final mapData = Map<String, dynamic>.from(response.data);
          return StudentUplodeSubjectModel.fromJson(mapData);
        }

      }

      return null;
    } catch (e) {
      print("Get Subject by ID API error: $e");
      return null;
    }
  }
}
