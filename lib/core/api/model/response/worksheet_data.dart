import 'package:telmeeth/core/api/model/response/worksheet.dart';

class WorksheetData {
  Worksheet? worksheet;
  int? totalMark;

  WorksheetData({this.worksheet, this.totalMark});

  factory WorksheetData.fromJson(Map<String, dynamic> json) {
    return WorksheetData(
      worksheet: json['worksheet'] != null ? Worksheet.fromJson(json['worksheet']) : null,
      totalMark: json['total_mark'],
    );
  }
}