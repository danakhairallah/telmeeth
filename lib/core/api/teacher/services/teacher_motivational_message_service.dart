import 'dart:io';
import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_motivational_message.dart';

class MotivationMessageServiceTeacher {
  Future<List<MotivationMessageTeacher>> getAllMessages() async {
    final dio = await ApiClient.getDio();
    final response = await dio.get("/teacher/motivational-messages");
    if (response.data["success"] == true) {
      final data = response.data["data"] as List;
      return data.map((e) => MotivationMessageTeacher.fromJson(e)).toList();
    }
    return [];
  }

  Future<MotivationMessageTeacher?> addMessage({
    required int studentId,
    required int classTeacherId,
    required String message,
    File? image,
  }) async {
    final dio = await ApiClient.getDio();
    final formData = FormData.fromMap({
      "student_id": studentId,
      "class_teacher_id": classTeacherId,
      "message": message,
      if (image != null) "image": await MultipartFile.fromFile(image.path),
    });

    final response = await dio.post(
      "/teacher/motivational-messages",
      data: formData,
    );
    if (response.data["success"] == true) {
      return MotivationMessageTeacher.fromJson(response.data["data"]);
    }
    return null;
  }

  Future<MotivationMessageTeacher?> updateMessage({
    required int id,
    required String message,
    File? image,
  }) async {
    final dio = await ApiClient.getDio();
    final formData = FormData.fromMap({
      "message": message,
      if (image != null) "image": await MultipartFile.fromFile(image.path),
    });

    final response = await dio.post(
      "/teacher/motivational-messages/$id",
      data: formData,
    );
    if (response.data["success"] == true) {
      return MotivationMessageTeacher.fromJson(response.data["data"]);
    }
    return null;
  }

  Future<bool> deleteMessage(int id) async {
    final dio = await ApiClient.getDio();
    final response = await dio.delete("/teacher/motivational-messages/$id");
    return response.data["success"] == true;
  }
}
