import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_mc_question_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_get_question_model.dart' hide Options;
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_question_by_id.dart'  hide Options;
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_question_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_mc_question_update.dart';

import '../model/response/teacher_mc_question_post.dart';

class TeacherMcQuestionService {
  Dio? dio;

  
  Future<TeacherMcQuestionGetModel?> getMcQuestionTask( int taskId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/tasks/$taskId/essay-questions");

      if (response.statusCode == 200) {
        return TeacherMcQuestionGetModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get MC Question Task: $e");
    }
    return null;
  }

  Future<TeacherMcQuestionGetByIdModel?> getMcQuestionTaskById( int taskId , int id) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/api/teacher/tasks/$taskId/mc-questions/$id");

      if (response.statusCode == 200) {
        return TeacherMcQuestionGetByIdModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in get MC Question Task by id: $e");
    }
    return null;
  }

  Future<TeacherMcQuestionPostModel?> createMcQuestion(TeacherMcQuestionRequestModel request , int taskId) async {
    try {
      final dio = await ApiClient.getDio();
      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/tasks/$taskId/mc-questions",
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TeacherMcQuestionPostModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in Create MC question: $e");
    }
    return null;
  }

  Future<TeacherMcQuestionUpdateModel?> updateMcQuestion(TeacherMcQuestionRequestModel request , int taskId , int id) async {
    try {
      final dio = await ApiClient.getDio();
      final formData = await request.toFormData();

      final response = await dio.post(
        "/teacher/tasks/$taskId/mc-questions/$id",
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TeacherMcQuestionUpdateModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in Update MC question: $e");
    }
    return null;
  }

  Future<TeacherMcQuestionDeleteModel?> deleteMcQuestionTask( int taskId , int id) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/teacher/tasks/$taskId/mc-questions/$id");

      if (response.statusCode == 200) {
        return TeacherMcQuestionDeleteModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error in Delete MC Question Task: $e");
    }
    return null;
  }
}