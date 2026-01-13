import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../student/services/announcement_services.dart';
import '../model/response/announcement_model.dart';
import '../model/response/announcement_data.dart';

class AnnouncementController with ChangeNotifier {
  final AnnouncementServices _services = AnnouncementServices();

  bool isLoading = false;

  AnnouncementModel? studentModel;
  AnnouncementModel? teacherModel;

  List<AnnouncementData> get allAnnouncements {
    return [
      ...(teacherModel?.data ?? []),
      ...(studentModel?.data ?? []),
    ];
  }

  Future<void> loadAllAnnouncements() async {
    isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      if (token.isEmpty) return;

      studentModel = await _services.getStudentAnnouncements(token);
      teacherModel = await _services.getTeacherAnnouncements(token);
    } catch (e) {
      print("Announcement Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
