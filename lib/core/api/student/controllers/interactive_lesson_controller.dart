import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/student/model/request/interactive_lesson_submit_request.dart';
import 'package:telmeeth/core/api/student/model/response/interactive_lesson_get_model.dart';
import 'package:telmeeth/core/api/student/model/response/interactive_lesson_submit_model.dart';
import 'package:telmeeth/core/api/student/services/interactive_lesson_service.dart';

class InteractiveLessonProvider extends ChangeNotifier {
  final InteractiveLessonService _service = InteractiveLessonService();
  InteractiveLessonGetModel? interactiveLesson;

  bool isLoading = false;
  InteractiveLessonSubmitModel? submitResponse;
  String? errorMessage;

  Future<InteractiveLessonSubmitModel> submitInteractiveLessonAnswer(
      InteractiveLessonSubmitRequest request) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result =
          await _service.submitInteractiveLessonAnswer(request);

      submitResponse = result;

      return result;
    } catch (e) {
      errorMessage = e.toString();

      return InteractiveLessonSubmitModel(
        message: errorMessage,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<InteractiveLessonGetModel?> fetchInteractiveLessonById(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getInteractiveLessonById(id);
    interactiveLesson = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}