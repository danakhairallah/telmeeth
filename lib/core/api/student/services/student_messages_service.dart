import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/student_messages_response.dart';

class StudentMessagesService {

  Future<StudentMessagesResponse?> getParentMessages() async {
    try {
      final Dio dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/parent-messages",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return StudentMessagesResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Parent Messages API Error: $e");
      return null;
    }
  }

  Future<StudentMessagesResponse?> getTeacherMessages() async {
    try {
      final Dio dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/teacher-messages",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return StudentMessagesResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Teacher Messages API Error: $e");
      return null;
    }
  }
}
