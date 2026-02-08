class MCQQuestion {
  int id;
  int worksheetId;
  String question;
  Map<String, String>? options;
  String? correctAnswer;
  String? imageUrl;
  String? imagePath;

  MCQQuestion({
    required this.id,
    required this.worksheetId,
    required this.question,
    this.options,
    this.correctAnswer,
    this.imageUrl,
    this.imagePath,
  });

  factory MCQQuestion.fromJson(Map<String, dynamic> json) {
    return MCQQuestion(
      id: json['id'],
      worksheetId: json['worksheet_id'],
      question: json['question'],
      options: json['options'] != null
          ? Map<String, String>.from(json['options'])
          : null,
      correctAnswer: json['correct_answer'],
      imageUrl: json['image_url'],
      imagePath: json['image_path'],
    );
  }
}