class AiChatSendRequest {
  final String message;
  AiChatSendRequest({required this.message});

  Map<String, dynamic> toJson() => {
    'message': message,
  };
}

class AiChatSendResponse {
  final String reply;
  AiChatSendResponse({required this.reply});

  factory AiChatSendResponse.fromJson(Map<String, dynamic> json) {
    return AiChatSendResponse(
      reply: json['reply'] ?? '',
    );
  }
}
