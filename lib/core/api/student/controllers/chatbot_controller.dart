import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/chatbot_message_model.dart';
import 'package:telmeeth/core/api/student/services/chatbot_service.dart';

class ChatbotController with ChangeNotifier {
  final ChatbotService _service = ChatbotService();

  bool isLoading = false;
  List<ChatbotMessageModel> messages = [];
  ChatbotReplyModel? lastReply;

  /// جلب كل المحادثات السابقة
  Future<void> fetchMessages() async {
    isLoading = true;
    notifyListeners();
    messages = await _service.getChatbotMessages();
    isLoading = false;
    notifyListeners();
  }

  /// إرسال رسالة جديدة (POST)
  Future<void> sendMessage(String msg, {String lang = "ar"}) async {
    isLoading = true;
    notifyListeners();
    lastReply = await _service.sendMessage(msg, lang: lang);
    isLoading = false;
    notifyListeners();
  }
}
