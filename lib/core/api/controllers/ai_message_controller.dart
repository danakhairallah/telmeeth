import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/request/ai_message_request.dart';
import 'package:telmeeth/core/api/model/response/ai_message_today_model.dart';
import 'package:telmeeth/core/api/student/services/ai_message_services.dart';

class AiMessageController with ChangeNotifier {
  final AiMessageServices _services = AiMessageServices();

  bool isLoading = false;
  List<AiMessageTodayModel> todayMessages = [];

  // ================= GET TODAY MESSAGES =================
  Future<List<AiMessageTodayModel>> getTodayMessages() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        '/api/student/ai/messages/today',
      );

      final List list = response.data['data'] ?? [];
      print('AI Today Messages: $list');

      return list.map((e) => AiMessageTodayModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Get Today Messages Error: $e');
      return [];
    }
  }


  // ================= SEND MESSAGE =================
  String? reply;

  Future<void> sendMessage(String message) async {
    isLoading = true;
    notifyListeners();

    try {
      final res = await _services.sendMessage(
        AiMessageRequest(
          message: message,
          language: 'ar',
        ),
      );

      reply = res?.reply;
      await getTodayMessages();   // هاي ضروري بعدها مباشرة
    } catch (e) {
      debugPrint('Send message error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


}
