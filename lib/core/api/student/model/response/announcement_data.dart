class AnnouncementData {
  int? id;
  String? text;
  String? type;
  String? priority;
  String? dateTime;

  AnnouncementData({
    this.id,
    this.text,
    this.type,
    this.priority,
    this.dateTime,
  });

  factory AnnouncementData.fromJson(Map<String, dynamic> json) {
    return AnnouncementData(
      id: json['id'],
      text: json['text'],
      type: json['type'],
      priority: json['priority'],
      dateTime: json['date_time'],
    );
  }
}
