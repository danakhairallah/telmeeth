class TransferUpdateRequest {
  int? branchId;
  String? type;
  String? date;
  int? schoolId;

  TransferUpdateRequest({this.branchId, this.type, this.date, this.schoolId});

  TransferUpdateRequest.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    type = json['type'];
    date = json['date'];
    schoolId = json['school_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['type'] = this.type;
    data['date'] = this.date;
    data['school_id'] = this.schoolId;
    return data;
  }
}