import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/my_children_detalis_model.dart';
import 'package:telmeeth/core/api/parent/model/response/my_children_model.dart';

class MyChildrenService {
  Dio? dio;

  Future<MyChildrenModel?> getMyChildren() async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/parent/my-students",
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );

    print("Response: ${response.data}");

    if (response.statusCode == 200) {
      return MyChildrenModel.fromJson(response.data);
    }

    return null;
  } catch (e) {
    if (e is DioException) {
      print("Dio error: ${e.response?.data}");
    } else {
      print("Unexpected error: $e");
    }
    return null;
  }
}

Future<MyChildrenDetalisModel?> getMyChildrenById(int studentId) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/my-student/$studentId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        return MyChildrenDetalisModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get My Children by ID error: $e");
      return null;
    }
  }
}