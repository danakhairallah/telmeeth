class WorksheetSubmitRequest {
  List<Answer>? answers;

  WorksheetSubmitRequest({this.answers});

  WorksheetSubmitRequest.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <Answer>[];
      json['answers'].forEach((v) {
        answers!.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  String? type;
  int? questionId;
  String? answer;

  Answer({this.type, this.questionId, this.answer});

  Answer.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    questionId = json['question_id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['question_id'] = this.questionId;
    data['answer'] = this.answer;
    return data;
  }
}
