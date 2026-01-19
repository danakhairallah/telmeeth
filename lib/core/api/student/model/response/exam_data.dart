
class ExamDetile {
  bool? status;
  String? message;
  ExamData? data;

  ExamDetile({this.status, this.message, this.data});

  ExamDetile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ExamData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
    questionsAvailable = json['questions_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exam != null) {
      data['exam'] = exam!.toJson();
    }
    data['questions_available'] = questionsAvailable;
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
        multipleChoiceQuestions!.add(MultipleChoiceQuestions.fromJson(v));
      });
    }
    if (json['essay_questions'] != null) {
      essayQuestions = <EssayQuestions>[];
      json['essay_questions'].forEach((v) {
        essayQuestions!.add(EssayQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['class_teacher_id'] = classTeacherId;
    data['date_time'] = dateTime;
    data['mark'] = mark;
    data['duration'] = duration;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (multipleChoiceQuestions != null) {
      data['multiple_choice_questions'] =
          multipleChoiceQuestions!.map((v) => v.toJson()).toList();
    }
    if (essayQuestions != null) {
      data['essay_questions'] =
          essayQuestions!.map((v) => v.toJson()).toList();
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
  Null imagePath;
  Null imageUrl;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['exam_id'] = examId;
    data['question'] = question;
    data['options'] = options;
    data['correct_answer'] = correctAnswer;
    data['mark'] = mark;
    data['image_path'] = imagePath;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class EssayQuestions {
  int? id;
  int? examId;
  String? question;
  String? hint;
  int? mark;
  Null imagePath;
  Null imageUrl;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exam_id'] = examId;
    data['question'] = question;
    data['hint'] = hint;
    data['mark'] = mark;
    data['image_path'] = imagePath;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}