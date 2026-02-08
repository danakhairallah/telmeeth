import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/question_bank_model.dart';

class QuestionBankService {
  Dio? dio;

  Future<QuestionBankModel?> getQuestionBankById(int lessonId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/student/question-bank/$lessonId",);

      if (response.statusCode == 200 && response.data['success'] == true) {
        return QuestionBankModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Question Bank by ID error: $e");
      return null;
    }
  }
}