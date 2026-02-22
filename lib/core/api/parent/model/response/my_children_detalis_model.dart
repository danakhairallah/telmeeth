import 'package:telmeeth/core/api/parent/model/response/my_children_model.dart';

class MyChildrenDetalisModel {
  bool? success;
  Data? data;

  MyChildrenDetalisModel({this.success, this.data});

  MyChildrenDetalisModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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