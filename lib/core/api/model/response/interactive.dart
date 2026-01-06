class Interactive {
  int? total;
  int? attended;
  int? attendanceRate;

  Interactive({this.total, this.attended, this.attendanceRate});

  Interactive.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    attended = json['attended'];
    attendanceRate = json['attendance_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['attended'] = this.attended;
    data['attendance_rate'] = this.attendanceRate;
    return data;
  }
}