class HighlightRequest {
  int lessonId;
  String color;
  String text;

  HighlightRequest({
    required this.lessonId,
    required this.color,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'lesson_id': lessonId,
      'color': color,
      'text': text,
    };
  }
}