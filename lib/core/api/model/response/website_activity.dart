import 'package:telmeeth/core/api/model/response/activity_data.dart';

class WebsiteActivity {
  bool? success;
  ActivityData? data;

  WebsiteActivity({this.success, this.data});

  WebsiteActivity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new ActivityData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}