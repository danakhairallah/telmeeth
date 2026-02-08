class Answers {
  final int questionId;
  final String answer;

  Answers({
    required this.questionId,
    required this.answer,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
      questionId: json['question_id'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "question_id": questionId,
      "answer": answer,
    };
  }
}
