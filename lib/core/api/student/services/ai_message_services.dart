
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/request/ai_message_request.dart';
import 'package:telmeeth/core/api/student/model/response/ai_message_response.dart';
import 'package:telmeeth/core/api/student/model/response/ai_message_today_model.dart';

class AiMessageServices {

  // ================= SEND MESSAGE =================
  Future<AiMessageResponse?> sendMessage(AiMessageRequest request) async {
    final dio = await ApiClient.getDio();
    final response = await dio.post('/student/ai/message', data: request.toJson());
    if (response.statusCode == 200) {
      return AiMessageResponse.fromJson(response.data);
    }
    return null;
  }

  // ================= GET TODAY MESSAGES =================
  Future<List<AiMessageTodayModel>> getTodayMessages() async {
    final dio = await ApiClient.getDio();
    final response = await dio.get('/student/ai/messages/today');
    final List list = response.data['data'] ?? [];
    return list.map((e) => AiMessageTodayModel.fromJson(e)).toList();
  }
}
