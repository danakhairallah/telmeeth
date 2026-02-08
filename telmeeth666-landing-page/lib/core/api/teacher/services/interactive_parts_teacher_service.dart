import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/interactive_parts_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/request/interactive_parts_teacher_update_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_update.dart';

class InteractivePartsService {
  Dio? dio;

  Future<InteractivePartsModel?> getInteractiveParts() async {
    try {
      final dio = await ApiClient.getDio(); // الحصول على Dio من ApiClient
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/interactive-parts",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return InteractivePartsModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getInteractiveParts: $e");
    }

    return null;
  }

  Future<InteractivePartsDetails?> getInteractivePartDetails(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/teacher/interactive-parts/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return InteractivePartsDetails.fromJson(response.data);
      }
    } catch (e) {
      print("Error in getInteractivePartDetails: $e");
    }
    return null;
  }

  Future<InteractivePartsPost?> addInteractiveParts(
      InteractivePartsRequestPost request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/interactive-parts",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return InteractivePartsPost.fromJson(response.data);
      }
    } catch (e) {
      print("Error in addInteractiveParts: $e");
    }
    return null;
  }

  Future<InteractivePartsUpdate?> updateInteractivePart(
    int id,
    InteractivePartsRequestUpdate request,
  ) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final formData = await request.toFormData();

      final response = await dio.post(
        "/api/teacher/interactive-parts/$id",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return InteractivePartsUpdate.fromJson(response.data);
      }
    } catch (e) {
      print("Error in updateInteractivePart: $e");
    }
    return null;
  }

  Future<InteractivePartsDelete?> deleteInteractivePart(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/api/teacher/interactive-parts/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return InteractivePartsDelete.fromJson(response.data);
      }
    } catch (e) {
      print("Error in deleteInteractivePart: $e");
    }
    return null;
  }
}

