class ScheduleTeacherRequest {
  String? dateTime;
  String? title;
  String? description;
  String? status;

  ScheduleTeacherRequest(
      {this.dateTime, this.title, this.description, this.status});

  ScheduleTeacherRequest.fromJson(Map<String, dynamic> json) {
    dateTime = json['date_time'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_time'] = this.dateTime;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}