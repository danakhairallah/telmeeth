class WorksheetMultiQuestionModel {
  bool? success;
  List<WorksheetMultiData>? worksheetMultiData;

  WorksheetMultiQuestionModel({this.success, this.worksheetMultiData});

  WorksheetMultiQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      worksheetMultiData = <WorksheetMultiData>[];
      json['data'].forEach((v) {
        worksheetMultiData!.add(new WorksheetMultiData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.worksheetMultiData != null) {
      data['data'] = this.worksheetMultiData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorksheetMultiData {
  int? id;
  int? worksheetId;
  String? question;
  List<String>? options;
  Null? correctAnswer;
  String? imageUrl;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  WorksheetMultiData(
      {this.id,
      this.worksheetId,
      this.question,
      this.options,
      this.correctAnswer,
      this.imageUrl,
      this.imagePath,
      this.createdAt,
      this.updatedAt});

  WorksheetMultiData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    worksheetId = json['worksheet_id'];
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'];
    imageUrl = json['image_url'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['worksheet_id'] = this.worksheetId;
    data['question'] = this.question;
    data['options'] = this.options;
    data['correct_answer'] = this.correctAnswer;
    data['image_url'] = this.imageUrl;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}