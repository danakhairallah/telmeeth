import 'package:dio/dio.dart';
import '../model/response/chatbot_response_teacher.dart';
import '../model/request/chatbot_request_teacher.dart';

class ChatbotServiceTeacher {
  final Dio dio;

  ChatbotServiceTeacher(this.dio);

  Future<List<ChatbotResponseTeacher>> fetchTodayChats() async {
    final response = await dio.get(
      '/teacher/chatbot/today',
    );

    if (response.data['status'] == 'success') {
      return (response.data['data'] as List)
          .map((e) => ChatbotResponseTeacher.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<ChatbotResponseTeacher> sendMessage(
      ChatbotRequestTeacher request) async {
    final response = await dio.post(
      '/teacher/chatbot',
      data: request.toJson(),
    );

    return ChatbotResponseTeacher.fromJson(response.data);
  }
}
