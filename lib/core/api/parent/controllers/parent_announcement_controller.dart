
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/announcement_model.dart';
import 'package:telmeeth/core/api/parent/services/announcement_services.dart';

class ParentAnnouncementController with ChangeNotifier {
  final ParentAnnouncementServices _services = ParentAnnouncementServices();

  ParentAnnouncementResponse? response;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadAnnouncements(int studentId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      response = await _services.getAllAnnouncements(studentId);

      if (response == null || response!.data.isEmpty) {
        errorMessage = "No Announcements Found";
      }
    } catch (e) {
      errorMessage = "Failed to load announcements";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }}