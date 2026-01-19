// ai_chat_parent_controller.dart
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/ai_chat_history_parent_model.dart';
import 'package:telmeeth/core/api/parent/model/response/ai_chat_send_request.dart';
import 'package:telmeeth/core/api/parent/services/ai_chat_parent_service.dart';


class AiChatParentController with ChangeNotifier {
  final AiChatParentService _service = AiChatParentService();

  List<AiChatMessage> history = [];
  bool isLoading = false;
  String? error;
  String? todayDate;

  Future<void> loadHistory() async {
    isLoading = true;
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
    isLoading = false;
    notifyListeners();
  }

  Future<String?> sendMessage(String message) async {
    isLoading = true;
    notifyListeners();
    final response = await _service.sendMessage(AiChatSendRequest(message: message));
    isLoading = false;
    if (response != null) {
      // Add to history (simulate as if server returns whole history, or manually append)
      history.add(AiChatMessage(
        message: message,
        response: response.reply,
        createdAt: DateTime.now().toIso8601String(),
      ));
      notifyListeners();
      return response.reply;
    }
    error = "Failed to send message";
    notifyListeners();
    return null;
  }
}
