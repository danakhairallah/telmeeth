import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/lesson_outcome_post_request.dart';
import 'package:telmeeth/core/api/teacher/model/request/lesson_outcome_update_request.dart';
import '../model/response/lesson_outcome_delete_model.dart';
import '../model/response/lesson_outcome_details_model.dart';
import '../model/response/lesson_outcome_model.dart';
import '../model/response/lesson_outcome_post_model.dart';
import '../model/response/lesson_outcome_update_model.dart';

class LessonOutcomeService {
  Dio? dio;

  Future<LessonOutComeModel?> getLessonOutCome() async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.get("/teacher/lesson-outcomes");

    if (response.statusCode == 200) {
      return LessonOutComeModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Lesson OutCome Error: $e");
    return null;
  }
}

Future<LessonOutComePostModel?> addLessonOutCome(LessonOutComePostRequest request) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.post(
      "/teacher/lesson-outcomes",
      data: request.toJson(),
    );

    if (response.statusCode == 200) {
      return LessonOutComePostModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Add Lesson OutCome Error: $e");
    return null;
  }
}

Future<LessonOutComeDetailsModel?> getLessonOutComeDetails(int lessonId) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.get(
      "/teacher/lesson-outcomes/$lessonId",
    );

    if (response.statusCode == 200) {
      return LessonOutComeDetailsModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Lesson OutCome Details Error: $e");
    return null;
  }
}

Future<LessonOutComeUpdateModel?> updateLessonOutCome(int lessonId , LessonOutComeUpdateRequest request) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.put(
      "/teacher/lesson-outcomes/$lessonId",
      data: request.toJson(),
    );

    if (response.statusCode == 200) {
      return LessonOutComeUpdateModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Update Lesson OutCome Error: $e");
    return null;
  }
}

Future<LessonOutComeDeleteModel?> deleteLessonOutCome(int lessonId) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.delete(
      "/teacher/lesson-outcomes/$lessonId",
    );

    if (response.statusCode == 200) {
      return LessonOutComeDeleteModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Delete Lesson OutCome Error: $e");
    return null;
  }
}
}