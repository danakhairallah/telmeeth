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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['attended'] = attended;
    data['attendance_rate'] = attendanceRate;
    return data;
  }
}