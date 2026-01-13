import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import '../../model/request/ai_message_request.dart';
import '../../model/response/ai_message_response.dart';
import '../../model/response/ai_message_today_model.dart';

class AiMessageServices {

  // ================= SEND MESSAGE =================
  Future<AiMessageResponse?> sendMessage(AiMessageRequest request) async {
    try {
      final dio = await ApiClient.getDio();

      // اطبع عنوان الريكوست للتأكد
      print('POST URL: ${dio.options.baseUrl}/student/ai/message');

      final response = await dio.post(
        '/student/ai/message', // جرب 'student/ai/message' بدون سلاش لو ما زبط
        data: request.toJson(),
      );

      print('AI Message response: ${response.data}');

      if (response.statusCode == 200) {
        return AiMessageResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('AI Message Error: $e');
      return null;
    }
  }

  // ================= GET TODAY MESSAGES =================
  Future<List<AiMessageTodayModel>> getTodayMessages() async {
    try {
      final dio = await ApiClient.getDio();

      // اطبع الـ BASE URL والمسار النهائي
      print('BASE_URL: ${dio.options.baseUrl}');
      print('GET: ${dio.options.baseUrl}/student/ai/messages/today');

      final response = await dio.get(
        'student/ai/messages/today',
      );


      print('---- Full AI Today Messages Response ----');
      print(response.data);

      if (response.data is Map && response.data.containsKey('data')) {
        print('data key found, data type: ${response.data['data'].runtimeType}');
      } else {
        print('data key NOT found!');
      }

      final List list = response.data['data'] ?? [];
      print('List: $list');

      return list.map((e) => AiMessageTodayModel.fromJson(e)).toList();
    } catch (e) {
      print('Get Today Messages Error: $e');
      return [];
    }
  }
}
