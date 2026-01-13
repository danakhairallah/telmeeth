class WorksheetSubmitRequest {
  List<Answer> answers;

  WorksheetSubmitRequest({required this.answers});

  Map<String, dynamic> toJson() {
    return {
      "answers": answers.map((e) => e.toJson()).toList(),
    };
  }
}

class Answer {
  String type; // "mcq" أو "essay"
  int questionId;
  String answer;

  Answer({
    required this.type,
    required this.questionId,
    required this.answer,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "question_id": questionId,
      "answer": answer,
    };
  }
}
