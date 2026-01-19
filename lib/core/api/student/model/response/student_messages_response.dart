import 'message_model.dart';

class StudentMessagesResponse {
  final int studentId;
  final String studentName;
  final List<MessageModel> messages;

  StudentMessagesResponse({
    required this.studentId,
    required this.studentName,
    required this.messages,
  });

  factory StudentMessagesResponse.fromJson(Map<String, dynamic> json) {
    return StudentMessagesResponse(
      studentId: json['student_id'] ?? 0,
      studentName: json['student_name'] ?? '',
      messages: (json['messages'] as List? ?? [])
          .map((e) => MessageModel.fromJson(e))
          .toList(),
    );
  }

}
