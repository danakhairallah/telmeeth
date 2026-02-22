import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/teacher/model/response/announcement_model_teacher.dart';

class AnnouncementServiceTeacher {
  Future<List<AnnouncementTeacher>> getAnnouncements() async {
    final dio = await ApiClient.getDio();

    final response = await dio.get('/teacher/announcements');

    final data = response.data;
    if (data is! List) {
      throw Exception("Invalid response format: expected List");
    }

    return data.map((e) => AnnouncementTeacher.fromJson(e)).toList().cast<AnnouncementTeacher>();
  }
  Future<AnnouncementTeacher> getAnnouncement(int id) async {
    final dio = await ApiClient.getDio();
    final response = await dio.get('/teacher/announcements/$id');
    return AnnouncementTeacher.fromJson(response.data);
  }

  Future<AnnouncementTeacher> createAnnouncement({
    required String text,
    required File file,
    required String priority,
    required DateTime dateTime,
    required String type,
    required int classTeacherId,
  }) async {
    final dio = await ApiClient.getDio();
    FormData formData = FormData.fromMap({
      "text": text,
      "file": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      "priority": priority,
      "date_time": dateTime.toIso8601String(),
      "type": type,
      "class_teacher_id": classTeacherId,
    });

    final response = await dio.post('/teacher/announcements', data: formData);
    return AnnouncementTeacher.fromJson(response.data['announcement']);
  }

  Future<AnnouncementTeacher> updateAnnouncement({
    required int id,
    required String text,
    File? file,
    required String priority,
    required DateTime dateTime,
    required String type,
  }) async {
    final dio = await ApiClient.getDio();
    Map<String, dynamic> data = {
      "text": text,
      "priority": priority,
      "date_time": dateTime.toIso8601String(),
      "type": type,
    };
    if (file != null) {
      data['file'] = await MultipartFile.fromFile(file.path, filename: file.path.split('/').last);
    }
    FormData formData = FormData.fromMap(data);
    final response = await dio.post('/teacher/announcements/$id', data: formData);
    return AnnouncementTeacher.fromJson(response.data['announcement']);
  }

  Future<void> deleteAnnouncement(int id) async {
    final dio = await ApiClient.getDio();
    await dio.delete('/teacher/announcements/$id');
  }
}
