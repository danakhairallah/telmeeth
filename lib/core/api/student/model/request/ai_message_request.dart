class AiMessageRequest {
  final String message;
  final String language;

  AiMessageRequest({
    required this.message,
    required this.language,
  });

  Map<String, dynamic> toJson() => {
    'message': message,
    'language': language,
  };
}
