import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/response/marks_detile.dart';
import 'package:telmeeth/core/api/model/response/marks_model.dart';
import 'package:telmeeth/core/api/student/services/marks_services.dart';

class MarksController extends ChangeNotifier {
  final MarksServices _services = MarksServices();

  /// الحالة
  bool isLoading = false;

  /// الداتا
  MarkModel? marks;
  MarkDetile? markDetails;

  /// أخطاء (اختياري)
  String? errorMessage;

  // =========================
  // Get All Marks
  // =========================
  Future<void> getMarks() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _services.getMarks();

      if (result != null) {
        marks = result;
      } else {
        errorMessage = "Failed to load marks";
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // Get Marks By Subject ID
  // =========================
  Future<void> getMarksById(int id) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _services.getMarksById(id);

      if (result != null) {
        markDetails = result;
      } else {
        errorMessage = "Failed to load mark details";
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // Clear Details (اختياري)
  // =========================
  void clearDetails() {
    markDetails = null;
    notifyListeners();
  }
}

