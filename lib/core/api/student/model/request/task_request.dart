class TaskSubmitRequest {
  List<Answers>? answers;

  TaskSubmitRequest({this.answers});

  TaskSubmitRequest.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
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

class Answers {
  String? type;
  int? questionId;
  String? answer;

  Answers({this.type, this.questionId, this.answer});

  Answers.fromJson(Map<String, dynamic> json) {
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