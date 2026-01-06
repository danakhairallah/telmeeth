import 'package:telmeeth/core/api/model/response/highlight_data.dart';

class HighlightModel {
  bool? success;
  String? message;
  List<HighlightData> data;

  HighlightModel({
    this.success,
    this.message,
    List<HighlightData>? data,
  }) : data = data ?? [];

  /// ================= FROM JSON =================
  factory HighlightModel.fromJson(Map<String, dynamic> json) {
    return HighlightModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] == null
          ? []
          : json['data'] is List
              ? (json['data'] as List)
                  .map((e) => HighlightData.fromJson(e))
                  .toList()
              : [HighlightData.fromJson(json['data'])],
    );
  }

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

