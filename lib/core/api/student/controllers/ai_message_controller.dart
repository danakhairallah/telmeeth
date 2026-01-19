import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/request/ai_message_request.dart';
import 'package:telmeeth/core/api/student/model/response/ai_message_today_model.dart';
import 'package:telmeeth/core/api/student/services/ai_message_services.dart';

class AiMessageController with ChangeNotifier {
  final AiMessageServices _services = AiMessageServices();

  bool isLoading = false;
  List<AiMessageTodayModel> todayMessages = [];

  // جلب رسائل اليوم وتحديث الـ List
  Future<void> fetchTodayMessages() async {
    isLoading = true;
    notifyListeners();
    todayMessages = await _services.getTodayMessages();
    isLoading = false;
    notifyListeners();
  }

  // إرسال رسالة ثم إعادة جلب الرسائل
  Future<void> sendMessage(String message) async {
    isLoading = true;
    notifyListeners();
    await _services.sendMessage(AiMessageRequest(message: message, language: 'ar'));
    await fetchTodayMessages();
    isLoading = false;
    notifyListeners();
  }
}
