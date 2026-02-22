class ChatbotRequestTeacher {
  final String message;

  ChatbotRequestTeacher({required this.message});

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
