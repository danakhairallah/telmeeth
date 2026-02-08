class LivelessonLeaveModel {
  bool? success;
  String? message;

  LivelessonLeaveModel({this.success, this.message});

  LivelessonLeaveModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}