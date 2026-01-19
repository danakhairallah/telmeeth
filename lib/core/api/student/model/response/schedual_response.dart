
import 'package:telmeeth/core/api/student/model/response/schedual_model.dart';

class SchedulesResponse {
  final bool success;
  final List<ScheduleModel> data;

  SchedulesResponse({
    required this.success,
    required this.data,
  });

  factory SchedulesResponse.fromJson(Map<String, dynamic> json) {
    return SchedulesResponse(
      success: json['success'],
      data: (json['data'] as List)
          .map((e) => ScheduleModel.fromJson(e))
          .toList(),
    );
  }
}
