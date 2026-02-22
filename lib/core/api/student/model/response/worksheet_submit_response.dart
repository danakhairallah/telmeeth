class WorksheetSubmitResponse {
  String? message;
  int? totalMark;

  WorksheetSubmitResponse({this.message, this.totalMark});

  WorksheetSubmitResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    totalMark = json['total_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['total_mark'] = this.totalMark;
    return data;
  }
}