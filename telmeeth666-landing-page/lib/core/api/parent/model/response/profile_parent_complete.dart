import 'package:telmeeth/core/api/parent/model/response/profile_parent_model.dart' show Data;

class ProfileParentComplete {
  bool? success;
  String? message;
  Data? data;

  ProfileParentComplete({this.success, this.message, this.data});

  ProfileParentComplete.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}