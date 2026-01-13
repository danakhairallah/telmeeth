import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/response/ai_advice_data.dart';
import 'package:telmeeth/core/api/model/response/ai_advice_model.dart';

class AiAdviceServices {

  Future<AiAdviceModel?> getAiAdvices() async {
    try {
      final Dio dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/ai-advice",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return AiAdviceModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("AI Advice API Error: $e");
      return null;
    }
  }
  Future<List<AiAdviceData>> getAllAiAdvices() async {
    try {
      final Dio dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/all-ai-advices",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((e) => AiAdviceData.fromJson(e))
            .toList();
      }

      return [];
    } catch (e) {
      print("Get All AI Advices API Error: $e");
      return [];
    }
  }

}
