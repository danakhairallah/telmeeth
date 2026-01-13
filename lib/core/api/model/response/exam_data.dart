import 'package:telmeeth/core/api/model/response/teachar_model.dart';

class ExamDetile {
  bool? status;
  String? message;
  ExamData? data;

  ExamDetile({this.status, this.message, this.data});

  ExamDetile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ExamData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ExamData {
  Exam? exam;
  bool? questionsAvailable;

  ExamData({this.exam, this.questionsAvailable});

  ExamData.fromJson(Map<String, dynamic> json) {
    exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
    questionsAvailable = json['questions_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exam != null) {
      data['exam'] = this.exam!.toJson();
    }
    data['questions_available'] = this.questionsAvailable;
    return data;
  }
}

class Exam {
  int? id;
  int? classTeacherId;
  String? dateTime;
  int? mark;
  int? duration;
  String? title;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;
  List<MultipleChoiceQuestions>? multipleChoiceQuestions;
  List<EssayQuestions>? essayQuestions;

  Exam(
      {this.id,
        this.classTeacherId,
        this.dateTime,
        this.mark,
        this.duration,
        this.title,
        this.description,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.multipleChoiceQuestions,
        this.essayQuestions});

  Exam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classTeacherId = json['class_teacher_id'];
    dateTime = json['date_time'];
    mark = json['mark'];
    duration = json['duration'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['multiple_choice_questions'] != null) {
      multipleChoiceQuestions = <MultipleChoiceQuestions>[];
      json['multiple_choice_questions'].forEach((v) {
        multipleChoiceQuestions!.add(new MultipleChoiceQuestions.fromJson(v));
      });
    }
    if (json['essay_questions'] != null) {
      essayQuestions = <EssayQuestions>[];
      json['essay_questions'].forEach((v) {
        essayQuestions!.add(new EssayQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['class_teacher_id'] = this.classTeacherId;
    data['date_time'] = this.dateTime;
    data['mark'] = this.mark;
    data['duration'] = this.duration;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.multipleChoiceQuestions != null) {
      data['multiple_choice_questions'] =
          this.multipleChoiceQuestions!.map((v) => v.toJson()).toList();
    }
    if (this.essayQuestions != null) {
      data['essay_questions'] =
          this.essayQuestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MultipleChoiceQuestions {
  int? id;
  int? examId;
  String? question;
  List<String>? options;
  String? correctAnswer;
  int? mark;
  Null? imagePath;
  Null? imageUrl;
  String? createdAt;
  String? updatedAt;

  MultipleChoiceQuestions(
      {this.id,
        this.examId,
        this.question,
        this.options,
        this.correctAnswer,
        this.mark,
        this.imagePath,
        this.imageUrl,
        this.createdAt,
        this.updatedAt});

  MultipleChoiceQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'];
    mark = json['mark'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exam_id'] = this.examId;
    data['question'] = this.question;
    data['options'] = this.options;
    data['correct_answer'] = this.correctAnswer;
    data['mark'] = this.mark;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EssayQuestions {
  int? id;
  int? examId;
  String? question;
  String? hint;
  int? mark;
  Null? imagePath;
  Null? imageUrl;
  String? createdAt;
  String? updatedAt;

  EssayQuestions(
      {this.id,
        this.examId,
        this.question,
        this.hint,
        this.mark,
        this.imagePath,
        this.imageUrl,
        this.createdAt,
        this.updatedAt});

  EssayQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    question = json['question'];
    hint = json['hint'];
    mark = json['mark'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exam_id'] = this.examId;
    data['question'] = this.question;
    data['hint'] = this.hint;
    data['mark'] = this.mark;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}