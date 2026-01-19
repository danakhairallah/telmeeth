
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/announcement_model.dart';
import 'package:telmeeth/core/api/parent/services/announcement_services.dart';

class ParentAnnouncementController with ChangeNotifier {
  final ParentAnnouncementServices _services = ParentAnnouncementServices();

  ParentAnnouncementResponse? response;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadAnnouncement(int id) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      response = await _services.getParentAnnouncementById(id);
      if (response == null || response?.data.isEmpty == true) {
        errorMessage = "No Announcement Data";
      }
    } catch (e) {
      errorMessage = "Failed to load announcement";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
