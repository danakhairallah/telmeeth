import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/teacher/model/request/live_lesson_create_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/live_lesson_create_response.dart';
import 'package:telmeeth/core/api/teacher/model/response/live_lesson_finsh_response.dart';
import 'package:telmeeth/core/api/teacher/model/response/live_lesson_join_response.dart';
import 'package:telmeeth/core/api/teacher/services/live_lesson_teacher_service.dart';

class LiveLessonTeacherController extends ChangeNotifier {
  final LiveLessonTeacherService service;

  LiveLessonTeacherController(this.service);

  /// =========================
  /// state
  /// =========================
  bool isLoading = false;
  String? error;

  LiveLessonCreateResponse? createModel;
  LiveLessonJoinResponse? joinModel;
  LiveLessonFinshResponse? finishModel;

  /// =========================
  /// CREATE LIVE LESSON
  /// =========================
  Future<LiveLessonCreateResponse?> createLiveLesson(
      LiveLessonCreateRequest request) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final model = await service.createLiveLesson(request);

      if (model != null) {
        createModel = model;
      } else {
        error = "Failed to create live lesson";
      }

      return model;
    } catch (e) {
      error = "Error in createLiveLesson: $e";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// =========================
  /// JOIN LIVE LESSON
  /// =========================
  Future<LiveLessonJoinResponse?> joinLiveLesson(int lessonId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final model = await service.getLiveLessonJoin(lessonId);

      if (model != null) {
        joinModel = model;
      } else {
        error = "Failed to join live lesson";
      }

      return model;
    } catch (e) {
      error = "Error in joinLiveLesson: $e";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// =========================
  /// FINISH LIVE LESSON
  /// =========================
  Future<LiveLessonFinshResponse?> finishLiveLesson(int lessonId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final model = await service.postLiveLessonFinish(lessonId);

      if (model != null) {
        finishModel = model;
      } else {
        error = "Failed to finish live lesson";
      }

      return model;
    } catch (e) {
      error = "Error in finishLiveLesson: $e";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}