import 'package:telmeeth/core/api/api_client.dart';
import '../model/request/recorded_lesson_request_std.dart';
import 'package:telmeeth/core/api/student/model/response/post_recorded_lesson.dart';
import 'package:telmeeth/core/api/student/model/response/recorded_lesson.dart';

class RecordedLessonServices {
Future<RecordedLessonModel?> getRecordedLessons(int lessonId) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.get(
      "/student/recorded-lessons/$lessonId",
    );

    if (response.statusCode == 200) {
      return RecordedLessonModel.fromJson(response.data);
    }

    return null;
  } catch (e) {
    print("Get Recorded Lessons API error: $e");
    return null;
  }
}

Future<PostRecordedLesson?> addAttendanceToRecordedLesson(RecordedLessonRequestStd recorded) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.post(
      "/student/recorded-lessons/attendance",
      data: recorded.toJson(),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      return PostRecordedLesson.fromJson(response.data);
    } else {
      print("Error: ${response.statusCode} - ${response.data}");
      return null;
    }
  } catch (e) {
    print("Recorded Lessons Error: $e");
    return null;
  }
  }
}