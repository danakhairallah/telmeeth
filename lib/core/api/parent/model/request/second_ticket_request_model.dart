import 'dart:convert';

SecondTicketRequestModel secondTicketRequestModelFromJson(String str) => SecondTicketRequestModel.fromJson(json.decode(str));

String secondTicketRequestModelToJson(SecondTicketRequestModel data) => json.encode(data.toJson());

class SecondTicketRequestModel {
    int? studentId;
    int? gateId;

    SecondTicketRequestModel({
        this.studentId,
        this.gateId,
    });

    factory SecondTicketRequestModel.fromJson(Map<String, dynamic> json) => SecondTicketRequestModel(
        studentId: json["student_id"],
        gateId: json["gate_id"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "gate_id": gateId,
    };
}
