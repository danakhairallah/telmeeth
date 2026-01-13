import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/model/request/nots_request.dart';
import 'package:telmeeth/core/api/model/response/note_model.dart';

class NoteServices {
  Dio? dio;

  Future<NoteModel?> getNotsById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/student/$id/notes",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        return NoteModel.fromJson(response.data['data']);
      }

      return null;
    } catch (e) {
      print("Get Nots by ID API error: $e");
      return null;
    }
  }

  Future<NoteModel?> addNotesById( int id ,NotsRequest note) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.post(
      "/student/$id/notes",
      data: note.toJson(), // هنا بعثنا الريكوست
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      // رجعنا الـ NoteModel من الـ JSON
      return NoteModel.fromJson(response.data);
    } else {
      print("Error: ${response.statusCode} - ${response.data}");
      return null;
    }
  } catch (e) {
    print("Add Note Error: $e");
    return null;
  }
  }

  Future<Note?> updateNotesById(int id, NotsRequest note) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.put(
        "/student/notes/$id", // تأكد من الرابط صحيح
        data: note.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        // يرجع مباشرة object النوت
        return Note.fromJson(response.data);
      } else {
        print("Update Note Error: ${response.statusCode} - ${response.data}");
        return null;
      }
    } catch (e) {
      print("Update Note Exception: $e");
      return null;
    }
  }

  Future<bool> deleteNoteById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.delete(
        "/student/notes/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return true;
      } else {
        print("Delete Note Failed: ${response.statusCode} - ${response.data}");
        return false;
      }
    } catch (e) {
      print("Delete Note Exception: $e");
      return false;
    }
  }
}
