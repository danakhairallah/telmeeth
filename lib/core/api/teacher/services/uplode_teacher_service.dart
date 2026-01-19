import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/uplode_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_update.dart';

class UplodesTeacherService {
  Dio? dio;

  Future<UplodesTeacherModel?> getUploads() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/uploads",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return UplodesTeacherModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getUploads: $e");
    }
    return null;
  }

  Future<UplodesTeacherPost?> uploadFile(FileUploadRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/uploads",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UplodesTeacherPost.fromJson(response.data);
      }
    } catch (e) {
      print("Error in uploadFile: $e");
    }
    return null;
  }

  Future<UplodesTeacherDetails?> getUploadDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/uploads/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return UplodesTeacherDetails.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getUploadDetails: $e");
    }
    return null;
  }

  Future<UplodesTeacherUpdate?> updateUpload(
    int id,
    FileUploadRequest request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/uploads/$id",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UplodesTeacherUpdate.fromJson(response.data);
      }
    } catch (e) {
      print("Error in updateUpload: $e");
    }
    return null;
  }

  Future<UplodesTeacherDelete?> deleteUpload(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/teacher/uploads/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return UplodesTeacherDelete.fromJson(response.data);
      }
    } catch (e) {
      print("Error in deleteUpload: $e");
    }
    return null;
  }
}
