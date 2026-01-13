class QuestionsModel {
  String? type;
  int? id;
  String? question;
  List<String>? options; // بدل Null
  String? imageUrl;      // بدل Null
  String? hint;
  int? mark;
  String? createdAt;

  QuestionsModel(
      {this.type,
      this.id,
      this.question,
      this.options,
      this.hint,
      this.imageUrl,
      this.mark,
      this.createdAt});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    question = json['question'];
    options = json['options'];
    hint = json['hint'];
    imageUrl = json['image_url'];
    mark = json['mark'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['question'] = this.question;
    data['options'] = this.options;
    data['hint'] = this.hint;
    data['image_url'] = this.imageUrl;
    data['mark'] = this.mark;
    data['created_at'] = this.createdAt;
    return data;
  }
}