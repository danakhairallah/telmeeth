import 'dart:io';

class CreateMotivationalMessageRequest {
  final int studentId;
  final String message;
  final File? image;

  CreateMotivationalMessageRequest({
    required this.studentId,
    required this.message,
    this.image,
  });
}
