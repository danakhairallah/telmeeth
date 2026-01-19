
class ParentAnnouncement {
  final int? id;
  final String? title;
  final String? content;
  final String? date;

  ParentAnnouncement({this.id, this.title, this.content, this.date});

  factory ParentAnnouncement.fromJson(Map<String, dynamic> json) {
    return ParentAnnouncement(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}

// هذا الريسبونس الرئيسي للـ parent
class ParentAnnouncementResponse {
  final bool success;
  final List<ParentAnnouncement> data;

  ParentAnnouncementResponse({
    required this.success,
    required this.data,
  });

  factory ParentAnnouncementResponse.fromJson(Map<String, dynamic> json) {
    return ParentAnnouncementResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List?)
          ?.map((e) => ParentAnnouncement.fromJson(e))
          .toList() ?? [],
    );
  }
}
