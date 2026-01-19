import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:telmeeth/core/api/student/model/response/announcement_model.dart';

class AnnouncementServices {
  final String baseUrl = 'https://YOUR_BASE_URL';

  Future<AnnouncementModel?> getStudentAnnouncements(String token) async {
    final url = Uri.parse('$baseUrl/api/student/announcements');
    final res = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    if (res.statusCode == 200) {
      return AnnouncementModel.fromJson(jsonDecode(res.body));
    }
    return null;
  }

  Future<AnnouncementModel?> getTeacherAnnouncements(String token) async {
    final url = Uri.parse('$baseUrl/api/student/teacher-announcements');
    final res = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    if (res.statusCode == 200) {
      return AnnouncementModel.fromJson(jsonDecode(res.body));
    }
    return null;
  }
}
