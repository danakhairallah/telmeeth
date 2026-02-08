class TaskTeacherDelete {
  bool? success;
  String? message;

  TaskTeacherDelete({this.success, this.message});

  TaskTeacherDelete.fromJson(Map<String, dynamic> json) {
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