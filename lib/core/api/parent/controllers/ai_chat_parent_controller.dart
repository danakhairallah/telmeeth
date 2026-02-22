import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/ai_chat_history_parent_model.dart';
import 'package:telmeeth/core/api/parent/model/response/ai_chat_send_request.dart';
import 'package:telmeeth/core/api/parent/services/ai_chat_parent_service.dart';

class AiChatParentController with ChangeNotifier {
  final AiChatParentService _service = AiChatParentService();

  List<AiChatMessage> history = [];

  bool isLoadingHistory = false;
  bool isSending = false;

  String? error;
  String? todayDate;

  Future<void> loadHistory() async {
    isLoadingHistory = true;
    error = null;
    notifyListeners();

    final res = await _service.fetchChatHistory();

    if (res != null) {
      history = res.data;
      todayDate = res.date;
    } else {
      error = "Failed to load chat history";
      history = [];
    }

    isLoadingHistory = false;
    notifyListeners();
  }

  Future<String?> sendMessage(String message) async {
    isSending = true;
    error = null;
    notifyListeners();

    final response =
    await _service.sendMessage(AiChatSendRequest(message: message));

    if (response != null) {
      history.add(AiChatMessage(
        message: message,
        response: response.reply,
        createdAt: DateTime.now().toIso8601String(),
      ));
    } else {
      error = "Failed to send message";
    }

    isSending = false;
    notifyListeners();

    return response?.reply;
  }
}