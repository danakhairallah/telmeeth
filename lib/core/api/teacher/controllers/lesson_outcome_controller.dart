import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/lesson_outcome_post_request.dart';
import 'package:telmeeth/core/api/teacher/model/request/lesson_outcome_update_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/lesson_outcome_delete_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/lesson_outcome_details_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/lesson_outcome_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/lesson_outcome_post_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/lesson_outcome_update_model.dart';
import 'package:telmeeth/core/api/teacher/services/lesson_outcome_service.dart';

class LessonOutcomeController extends ChangeNotifier {
  final LessonOutcomeService _service = LessonOutcomeService();

  bool isLoading = false;
  String? error;

  LessonOutComeModel? lessonOutcomes;
  LessonOutComeDetailsModel? details;

  Future<LessonOutComeModel?> getLessonOutcomes() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getLessonOutCome();

      lessonOutcomes = result;
      return result;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<LessonOutComePostModel?> addLessonOutcome(
      LessonOutComePostRequest request) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await _service.addLessonOutCome(request);
      
      await getLessonOutcomes();

      return result;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<LessonOutComeDetailsModel?> getDetails(int lessonId) async {
    try {
      isLoading = true;
      notifyListeners();

      final result =
          await _service.getLessonOutComeDetails(lessonId);

      details = result;

      return result;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<LessonOutComeUpdateModel?> updateLessonOutcome(
      int lessonId,
      LessonOutComeUpdateRequest request) async {
    try {
      isLoading = true;
      notifyListeners();

      final result =
          await _service.updateLessonOutCome(lessonId, request);

      await getLessonOutcomes();

      return result;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<LessonOutComeDeleteModel?> deleteLessonOutcome(
      int lessonId) async {
    try {
      isLoading = true;
      notifyListeners();

      final result =
          await _service.deleteLessonOutCome(lessonId);

      await getLessonOutcomes();

      return result;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}