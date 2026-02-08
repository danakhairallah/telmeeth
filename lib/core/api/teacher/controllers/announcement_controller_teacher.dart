import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/announcement_model_teacher.dart';
import 'package:telmeeth/core/api/teacher/services/announcement_service_teacher.dart';

class AnnouncementControllerTeacher with ChangeNotifier {
  final AnnouncementServiceTeacher _service = AnnouncementServiceTeacher();
  List<AnnouncementTeacher> announcements = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchAnnouncements() async {
    isLoading = true;
    notifyListeners();

    print("🔵 fetchAnnouncements() CALLED");

    try {
      announcements = await _service.getAnnouncements();
      for (var ann in announcements) {
        print("ID: ${ann.id} | Priority: ${ann.priority} | Type: ${ann.type} | Text: ${ann.text}");
      }

      print("🟢 announcements length = ${announcements.length}");
      print("🟢 announcements data = $announcements");

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      print("🔴 ERROR in fetchAnnouncements: $errorMessage");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> createAnnouncement({
    required String text,
    required File file,
    required String priority,
    required DateTime dateTime,
    required String type,
    required int classTeacherId,
  }) async {
    isLoading = true; notifyListeners();
    try {
      await _service.createAnnouncement(
        text: text,
        file: file,
        priority: priority,
        dateTime: dateTime,
        type: type,
        classTeacherId: classTeacherId,
      );
      await fetchAnnouncements();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false; notifyListeners();
  }

  Future<void> updateAnnouncement({
    required int id,
    required String text,
    File? file,
    required String priority,
    required DateTime dateTime,
    required String type,
  }) async {
    isLoading = true; notifyListeners();
    try {
      await _service.updateAnnouncement(
        id: id,
        text: text,
        file: file,
        priority: priority,
        dateTime: dateTime,
        type: type,
      );
      await fetchAnnouncements();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false; notifyListeners();
  }

  Future<void> deleteAnnouncement(int id) async {
    isLoading = true; notifyListeners();
    try {
      await _service.deleteAnnouncement(id);
      await fetchAnnouncements();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false; notifyListeners();
  }
}
