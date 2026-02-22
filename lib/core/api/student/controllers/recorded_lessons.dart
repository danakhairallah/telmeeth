import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/request/recorded_lesson_request_std.dart';
import 'package:telmeeth/core/api/student/model/response/post_recorded_lesson.dart';
import 'package:telmeeth/core/api/student/model/response/recorded_lesson.dart';
import 'package:telmeeth/core/api/student/services/recorded_lesson_services.dart';

class RecordedLessonsController extends ChangeNotifier {
  final RecordedLessonServices _service = RecordedLessonServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? errorMessage;

  RecordedLessonModel? _lessons;
  RecordedLessonModel? get lessons => _lessons;
  PostRecordedLesson? attendanceResponse;

  Future<RecordedLessonModel?> getRecordedLessons(int lessonId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _service.getRecordedLessons(lessonId);

      _lessons = result;

      return result;
    } catch (e) {
      print("Controller getRecordedLessons error: $e");
      _lessons = null;
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<PostRecordedLesson?> addAttendanceToRecordedLesson(
      RecordedLessonRequestStd recorded) async {
    try {
      _isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result =
          await _service.addAttendanceToRecordedLesson(recorded);

      attendanceResponse = result;

      return result; 
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _lessons = null;
    notifyListeners();
  }
}

