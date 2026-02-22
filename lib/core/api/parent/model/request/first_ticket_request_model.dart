import 'dart:convert';

FirstTicketRequestModel firstTicketRequestModelFromJson(String str) => FirstTicketRequestModel.fromJson(json.decode(str));

String firstTicketRequestModelToJson(FirstTicketRequestModel data) => json.encode(data.toJson());

class FirstTicketRequestModel {
    int? studentId;

    FirstTicketRequestModel({
        this.studentId,
    });

    factory FirstTicketRequestModel.fromJson(Map<String, dynamic> json) => FirstTicketRequestModel(
        studentId: json["student_id"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
    };
}
