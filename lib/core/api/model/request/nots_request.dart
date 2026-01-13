class NotsRequest {
  String? text;

  NotsRequest({this.text});

  NotsRequest.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text?.toString() ?? '';
    return data;
  }
}