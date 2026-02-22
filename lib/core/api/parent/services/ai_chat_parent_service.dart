// ai_chat_parent_service.dart
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/parent/model/response/ai_chat_history_parent_model.dart';
import 'package:telmeeth/core/api/parent/model/response/ai_chat_send_request.dart';

import 'package:telmeeth/core/api/api_client.dart';

class AiChatParentService {
  Future<AiChatHistoryParentResponse?> fetchChatHistory() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      final response = await dio.get(
        "/parent/chatbot/today",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return AiChatHistoryParentResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("AI Chat history error: $e");
      return null;
    }
  }

  Future<AiChatSendResponse?> sendMessage(AiChatSendRequest request) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";
      final response = await dio.post(
        "/parent/chatbot",
        data: request.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        return AiChatSendResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("AI Chat send error: $e");
      return null;
    }
  }
}
