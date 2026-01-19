class AnnouncementData {
  int? id;
  String? title;
  String? body;
  String? createdAt;

  AnnouncementData({
    this.id,
    this.title,
    this.body,
    this.createdAt,
  });

  factory AnnouncementData.fromJson(Map<String, dynamic> json) {
    return AnnouncementData(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdAt: json['created_at'],
    );
  }
}
