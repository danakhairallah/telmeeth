
import 'package:telmeeth/core/api/student/model/response/profile_data.dart';

class ProfileModel {
  bool? status;
  ProfileData? data;
  String? message;

  ProfileModel({this.status, this.data , this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}