import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/chatbot_message_model.dart';

class ChatbotService {
  /// GET – Get chatbot conversation history
  Future<List<ChatbotMessageModel>> getChatbotMessages() async {
    try {
      final Dio dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/chatbot",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final List list = response.data['data'] ?? [];
        return list.map((e) => ChatbotMessageModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print("Chatbot GET API Error: $e");
      return [];
    }
  }

  /// POST – Send a message and get a reply
  Future<ChatbotReplyModel?> sendMessage(String message, {String lang = "ar"}) async {
    try {
      final Dio dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.post(
        "/student/chatbot",
        data: {
          "message": message,
          "language": lang,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return ChatbotReplyModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Chatbot POST API Error: $e");
      return null;
    }
  }
}
