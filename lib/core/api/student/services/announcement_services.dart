import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/student/model/response/announcement_model.dart';
import 'package:telmeeth/core/api/api_client.dart';

class AnnouncementServices {
  /// ===== Get Student Announcements =====
  Future<AnnouncementModel?> getStudentAnnouncements() async {
    try {
      final dio = await ApiClient.getDio();
      final res = await dio.get('/student/announcements');

      if (res.statusCode == 200) {
        return AnnouncementModel.fromJson(res.data);
      } else {
        print("Student Announcements Error: Status ${res.statusCode}");
      }
    } on DioError catch (e) {
      print("Dio Error (Student Announcements): ${e.message}");
    } catch (e) {
      print("Unknown Error (Student Announcements): $e");
    }
    return null;
  }

  /// ===== Get Teacher Announcements =====
  Future<AnnouncementModel?> getTeacherAnnouncements() async {
    try {
      final dio = await ApiClient.getDio();
      final res = await dio.get('/student/teacher-announcements');

      if (res.statusCode == 200) {
        return AnnouncementModel.fromJson(res.data);
      } else {
        print("Teacher Announcements Error: Status ${res.statusCode}");
      }
    } on DioError catch (e) {
      print("Dio Error (Teacher Announcements): ${e.message}");
    } catch (e) {
      print("Unknown Error (Teacher Announcements): $e");
    }
    return null;
  }
}
