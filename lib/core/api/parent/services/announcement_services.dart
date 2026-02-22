
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/announcement_model.dart';

class ParentAnnouncementServices {
  Future<ParentAnnouncementResponse?> getAllAnnouncements(int studentId) async {
    try {
      final dio = await ApiClient.getDio();

      print("Calling: /parent/announcements/$studentId");

      final response = await dio.get(
        "/parent/announcements/$studentId",
      );

      print("RAW RESPONSE:");
      print(response.data);

      if (response.statusCode == 200) {
        return ParentAnnouncementResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }}