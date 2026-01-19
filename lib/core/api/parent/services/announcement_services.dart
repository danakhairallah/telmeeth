
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/announcement_model.dart';

class ParentAnnouncementServices {
  Future<ParentAnnouncementResponse?> getParentAnnouncementById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/announcements/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      print("ANNOUNCEMENT API RAW RESPONSE:");
      print(response.data);

      if (response.statusCode == 200) {
        return ParentAnnouncementResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Parent Announcement API error: $e");
      return null;
    }
  }
}
