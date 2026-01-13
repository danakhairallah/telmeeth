import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/response/lesson_model.dart';
import 'package:telmeeth/core/api/student/services/lesson_services.dart';

class LessonController with ChangeNotifier {
  final LessonServices _lessonServices = LessonServices();

  LessonModel? lesson;
  bool isLoading = false;

  // جلب الحصة بناءً على unitId
  Future<void> getLessonById(int unitId) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await _lessonServices.getLessonById(unitId);

      if (result != null) {
        lesson = result;
      } else {
        lesson = null;
      }
    } catch (e) {
      print("Error in getLessonById: $e");
      lesson = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
