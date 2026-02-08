import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/live_lesson_leave.dart';
import 'package:telmeeth/core/api/student/model/response/live_lesson_model.dart';
import 'package:telmeeth/core/api/student/services/live_lesson_service.dart';

class LiveLessonController extends ChangeNotifier {
  final LiveLessonService _service = LiveLessonService();

  bool isLoading = false;
  LiveLessonsModel? liveLesson;
  LivelessonLeaveModel? leaveResponse;
  String? errorMessage;

  Future<LiveLessonsModel?> getLiveLessonJoinById(int lessonId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _service.getLiveLessonJoinById(lessonId);

      if (result != null) {
        liveLesson = result;
        return result;
      } else {
        errorMessage = "Failed to load live lesson";
        return null;
      }
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<LivelessonLeaveModel?> postLiveLessonLeaveById(int lessonId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result =
          await _service.postLiveLessonLeaveById(lessonId);

      leaveResponse = result;

      return result;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  
  void clear() {
    liveLesson = null;
    errorMessage = null;
    notifyListeners();
  }
}
