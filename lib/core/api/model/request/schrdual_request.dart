class SchedualRequest {
  String? day;
  String? startTime;
  String? endTime;
  String? task;
  String? description;
  String? status;

  SchedualRequest(
      {this.day,
      this.startTime,
      this.endTime,
      this.task,
      this.description,
      this.status});

  SchedualRequest.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    task = json['task'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['task'] = this.task;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}