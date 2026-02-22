import 'dart:io';
import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/parent/model/request/create_motivational_message_request.dart';
import 'package:telmeeth/core/api/parent/model/response/motivational_message_model.dart';

class MotivationalMessagesService {
  final Dio dio;

  MotivationalMessagesService(this.dio);

  Future<List<MotivationalMessageModel>> getMessages() async {
    try {
      final res = await dio.get('/parent/motivational-messages');
      final List data = res.data['data'] ?? [];
      return data.map((e) => MotivationalMessageModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading messages: $e');
      return [];
    }
  }

  Future<void> create(CreateMotivationalMessageRequest req) async {
    try {
      final formData = FormData.fromMap({
        'student_id': req.studentId,
        'message': req.message,
        if (req.image != null)
          'image': await MultipartFile.fromFile(req.image!.path),
      });

      await dio.post(
        '/parent/motivational-messages',
        data: formData,
      );
    } catch (e) {
      print('Error creating message: $e');
      rethrow;
    }
  }

  Future<void> update(int id, String message, File? image) async {
    try {
      final formData = FormData.fromMap({
        'message': message,
        if (image != null)
          'image': await MultipartFile.fromFile(image.path),
      });

      await dio.post(
        '/parent/motivational-messages/$id',
        data: formData,
      );
    } catch (e) {
      print('Error updating message: $e');
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      await dio.delete('/parent/motivational-messages/$id');
    } catch (e) {
      print('Error deleting message: $e');
      rethrow;
    }
  }
}
