class WorksheetEssayQuestionModel {
  bool? success;
  List<WorksheetEssayData>? worksheetEssayData;

  WorksheetEssayQuestionModel({this.success, this.worksheetEssayData});

  WorksheetEssayQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      worksheetEssayData = <WorksheetEssayData>[];
      json['data'].forEach((v) {
        worksheetEssayData!.add(new WorksheetEssayData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.worksheetEssayData != null) {
      data['data'] = this.worksheetEssayData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorksheetEssayData {
  int? id;
  int? worksheetId;
  String? question;
  String? hint;
  String? imagePath;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  WorksheetEssayData(
      {this.id,
      this.worksheetId,
      this.question,
      this.hint,
      this.imagePath,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  WorksheetEssayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    worksheetId = json['worksheet_id'];
    question = json['question'];
    hint = json['hint'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['worksheet_id'] = this.worksheetId;
    data['question'] = this.question;
    data['hint'] = this.hint;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}