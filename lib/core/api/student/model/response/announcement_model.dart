import 'announcement_data.dart';

class AnnouncementModel {
  dynamic student; // id أو اسم
  List<AnnouncementData> data;

  AnnouncementModel({
    this.student,
    List<AnnouncementData>? data,
  }) : data = data ?? [];

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      student: json['student'] ?? json['student_id'],
      data: json['data'] == null
          ? []
          : (json['data'] as List)
          .map((e) => AnnouncementData.fromJson(e))
          .toList(),
    );
  }
}
