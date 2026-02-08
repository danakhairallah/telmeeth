class InteractivePartsDelete {
  bool? status;
  String? message;

  InteractivePartsDelete({this.status, this.message});

  InteractivePartsDelete.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}