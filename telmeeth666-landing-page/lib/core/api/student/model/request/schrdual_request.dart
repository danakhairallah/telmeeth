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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['task'] = task;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}