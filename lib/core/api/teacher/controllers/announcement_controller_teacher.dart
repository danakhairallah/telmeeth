import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/response/announcement_model_teacher.dart';
import 'package:telmeeth/core/api/teacher/services/announcement_service_teacher.dart';

enum AnnouncementScopeFilter { all, publicOnly, privateOnly }

class AnnouncementControllerTeacher with ChangeNotifier {
  final AnnouncementServiceTeacher _service = AnnouncementServiceTeacher();

  List<AnnouncementTeacher> announcements = [];
  bool isLoading = false;
  String? errorMessage;

  AnnouncementScopeFilter scopeFilter = AnnouncementScopeFilter.all;

  void setScopeFilter(AnnouncementScopeFilter value) {
    scopeFilter = value;
    notifyListeners();
  }

  List<AnnouncementTeacher> get filteredAnnouncements {
    bool isPublic(AnnouncementTeacher a) {
      final t = a.type.toLowerCase();
      return t == 'public' || t == 'general';
    }

    switch (scopeFilter) {
      case AnnouncementScopeFilter.publicOnly:
        return announcements.where(isPublic).toList();
      case AnnouncementScopeFilter.privateOnly:
        return announcements.where((a) => !isPublic(a)).toList();
      case AnnouncementScopeFilter.all:
      default:
        return announcements;
    }
  }

  List<AnnouncementTeacher> get publicAnnouncements =>
      announcements.where((a) {
        final t = a.type.toLowerCase();
        return t == 'public' || t == 'general';
      }).toList();

  Future<void> fetchAnnouncements() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await _service.getAnnouncements();
      announcements = result;
    } catch (e) {
      errorMessage = e.toString();
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
    isLoading = true;
    notifyListeners();
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
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateAnnouncement({
    required int id,
    required String text,
    File? file,
    required String priority,
    required DateTime dateTime,
    required String type,
  }) async {
    isLoading = true;
    notifyListeners();
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
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteAnnouncement(int id) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.deleteAnnouncement(id);
      await fetchAnnouncements();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
