class UplodeScoreRequest {
  int? uploadId;
  int? teacherUploadId;

  UplodeScoreRequest({this.uploadId, this.teacherUploadId});

  UplodeScoreRequest.fromJson(Map<String, dynamic> json) {
    uploadId = json['upload_id'];
    teacherUploadId = json['teacher_upload_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upload_id'] = this.uploadId;
    data['teacher_upload_id'] = this.teacherUploadId;
    return data;
  }
}