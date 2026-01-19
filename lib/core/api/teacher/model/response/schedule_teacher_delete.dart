class ScheduleTeacherDelete {
  bool? success;
  String? message;

  ScheduleTeacherDelete({this.success, this.message});

  ScheduleTeacherDelete.fromJson(Map<String, dynamic> json) {
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