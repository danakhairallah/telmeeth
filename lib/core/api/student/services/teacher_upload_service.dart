import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/teacher_upload_model.dart';

class TeacherUploadService {
  Future<List<TeacherUploadModel>?> getUploadsByUnit(int unitId) async {
    try {
      final dio = await ApiClient.getDio();
      final response = await dio.get(
          "/student/teacher-uploads/unit/$unitId"
      );
      if (response.statusCode == 200 && response.data['success'] == true) {
        final List dataList = response.data['data'];
        return dataList.map((e) => TeacherUploadModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      print("TeacherUploadService error: $e");
      return null;
    }
  }

  Future<List<TeacherUploadModel>?> getUploadsByLesson(int lessonId) async {
    try {
      final dio = await ApiClient.getDio();
      final response = await dio.get(
          "/student/teacher-uploads/lesson/$lessonId"
      );
      if (response.statusCode == 200 && response.data['success'] == true) {
        final List dataList = response.data['data'];
        return dataList.map((e) => TeacherUploadModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      print("TeacherUploadService error: $e");
      return null;
    }
  }
}
