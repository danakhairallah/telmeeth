import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/student/services/announcement_services.dart';
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
      // ===== Load Student Announcements =====
      studentModel = await _services.getStudentAnnouncements();
      print('Student announcements length: ${studentModel?.data.length}');
      studentModel?.data.forEach((e) {
        print('Student: ${e.type} | ${e.text}');
      });

      // ===== Load Teacher Announcements =====
      teacherModel = await _services.getTeacherAnnouncements();
      print('Teacher announcements length: ${teacherModel?.data.length}');
      teacherModel?.data.forEach((e) {
        print('Teacher: ${e.type} | ${e.text}');
      });

    } catch (e) {
      print("Announcement Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
