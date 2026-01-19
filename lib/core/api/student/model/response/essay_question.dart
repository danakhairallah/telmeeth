class EssayQuestion {
  int id;
  int worksheetId;
  String question;
  String? hint;
  String? imageUrl;
  String? imagePath;

  EssayQuestion({
    required this.id,
    required this.worksheetId,
    required this.question,
    this.hint,
    this.imageUrl,
    this.imagePath,
  });

  factory EssayQuestion.fromJson(Map<String, dynamic> json) {
    return EssayQuestion(
      id: json['id'],
      worksheetId: json['worksheet_id'],
      question: json['question'],
      hint: json['hint'],
      imageUrl: json['image_url'],
      imagePath: json['image_path'],
    );
  }
}