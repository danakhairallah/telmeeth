class AiChatHistoryParentResponse {
  final String status;
  final String date;
  final List<AiChatMessage> data;

  AiChatHistoryParentResponse({
    required this.status,
    required this.date,
    required this.data,
  });

  factory AiChatHistoryParentResponse.fromJson(Map<String, dynamic> json) {
    return AiChatHistoryParentResponse(
      status: json['status'] ?? '',
      date: json['date'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AiChatMessage.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class AiChatMessage {
  final String message;
  final String response;
  final String createdAt;

  AiChatMessage({
    required this.message,
    required this.response,
    required this.createdAt,
  });

  factory AiChatMessage.fromJson(Map<String, dynamic> json) {
    return AiChatMessage(
      message: json['message'] ?? '',
      response: json['response'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
