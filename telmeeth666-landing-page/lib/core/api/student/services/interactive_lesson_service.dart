import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/request/interactive_lesson_submit_request.dart';
import 'package:telmeeth/core/api/student/model/response/interactive_lesson_submit_model.dart';

class InteractiveLessonService {
  Dio? dio;

  Future<InteractiveLessonSubmitModel> submitInteractiveLessonAnswer( InteractiveLessonSubmitRequest request) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.post(
      "/student/interactive-lessons/submit-answer",
      data: request.toJson(),
    );

    if (response.statusCode == 200 && response.data != null) {
      return InteractiveLessonSubmitModel.fromJson(response.data);
    } else {
      return InteractiveLessonSubmitModel(
        message: "Failed to submit task (Status code: ${response.statusCode})",
      );
    }
  } catch (e) {
    print("Submit Interactive Lesson Answer error: $e");
    return InteractiveLessonSubmitModel(
    );
  }
}
}