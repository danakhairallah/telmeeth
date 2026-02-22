import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_essay_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_essay_post_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_essay_question_get_by_id.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_essay_question_get_model.dart';

class TeacherEssayQuestionService {
  Dio? dio;

  Future<TeacherEssayQuestionGetModel?> getEssayQuestionTask( int taskId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/tasks/$taskId/essay-questions");

      if (response.statusCode == 200) {
        return TeacherEssayQuestionGetModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get Essay Question Task: $e");
    }
    return null;
  }

  Future<TeacherEssayQuestionGetByIdModel?> getEssayQuestionTaskById( int taskId , int id) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/tasks/$taskId/essay-questions/$id");

      if (response.statusCode == 200) {
        return TeacherEssayQuestionGetByIdModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get Essay Question Task by id: $e");
    }
    return null;
  }

  Future<TeacherEssayQuestionPostModel?> createEssayQuestion(TeacherEssayQuestionRequestModel request , int taskId) async {
    try {
      final dio = await ApiClient.getDio();
      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/tasks/$taskId/essay-questions",
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TeacherEssayQuestionPostModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in Create Essay question: $e");
    }
    return null;
  }
}