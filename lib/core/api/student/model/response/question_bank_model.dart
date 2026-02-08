class QuestionBankModel {
  bool? success;
  List<Question>? data;

  QuestionBankModel({this.success, this.data});

  QuestionBankModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    if (json['data'] != null) {
      data = <Question>[];
      json['data'].forEach((v) {
        data!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class Question {
  int? id;
  int? lessonId;
  String? question;
  QuestionOptions? options;
  String? correctAnswer;
  List<String>? images;
  String? createdAt;
  String? updatedAt;

  Question({
    this.id,
    this.lessonId,
    this.question,
    this.options,
    this.correctAnswer,
    this.images,
    this.createdAt,
    this.updatedAt,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonId = json['lesson_id'];
    question = json['question'];

    options = json['options'] != null
        ? QuestionOptions.fromJson(json['options'])
        : null;

    correctAnswer = json['correct_answer'];

    images = json['images'] != null
        ? List<String>.from(json['images'])
        : [];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lesson_id': lessonId,
      'question': question,
      'options': options?.toJson(),
      'correct_answer': correctAnswer,
      'images': images,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class QuestionOptions {
  String? a;
  String? b;
  String? c;
  String? d;

  QuestionOptions({this.a, this.b, this.c, this.d});

  QuestionOptions.fromJson(Map<String, dynamic> json) {
    a = json['A'];
    b = json['B'];
    c = json['C'];
    d = json['D'];
  }

  Map<String, dynamic> toJson() {
    return {
      'A': a,
      'B': b,
      'C': c,
      'D': d,
    };
  }
}
