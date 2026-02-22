
import 'package:telmeeth/core/api/student/model/response/ai_advice_data.dart';

class AiAdviceModel {
  final bool? success;
  final String? message;
  final List<AiAdviceData> data;

  AiAdviceModel({
    this.success,
    this.message,
    required this.data,
  });

  factory AiAdviceModel.fromJson(Map<String, dynamic> json) {
    // Check if "data" is a List or a Map
    if (json['data'] is List) {
      return AiAdviceModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List)
            .map((e) => AiAdviceData.fromJson(e))
            .toList(),
      );
    } else if (json['data'] is Map) {
      return AiAdviceModel(
        success: json['success'],
        message: json['message'],
        data: [AiAdviceData.fromJson(json['data'])],
      );
    } else {
      // Sometimes the API may just return the object directly
      return AiAdviceModel(
        success: json['success'],
        message: json['message'],
        data: [AiAdviceData.fromJson(json)],
      );
    }
  }
}
