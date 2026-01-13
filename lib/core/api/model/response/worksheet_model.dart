import 'package:telmeeth/core/api/model/response/worksheet_data.dart';

class WorksheetModel {
  bool status;
  String? message;
  WorksheetData? data;

  WorksheetModel({required this.status, this.message, this.data});

  factory WorksheetModel.fromJson(Map<String, dynamic> json) {
    return WorksheetModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? WorksheetData.fromJson(json['data']) : null,
    );
  }
}