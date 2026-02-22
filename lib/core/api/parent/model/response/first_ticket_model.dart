import 'dart:convert';

FirstTicketModel firstTicketModelFromJson(String str) => FirstTicketModel.fromJson(json.decode(str));

String firstTicketModelToJson(FirstTicketModel data) => json.encode(data.toJson());

class FirstTicketModel {
    Ticket? ticket;

    FirstTicketModel({
        this.ticket,
    });

    factory FirstTicketModel.fromJson(Map<String, dynamic> json) => FirstTicketModel(
        ticket: json["ticket"] == null ? null : Ticket.fromJson(json["ticket"]),
    );

    Map<String, dynamic> toJson() => {
        "ticket": ticket?.toJson(),
    };
}

class Ticket {
    int? waitingRoomStudentId;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Ticket({
        this.waitingRoomStudentId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        waitingRoomStudentId: json["waiting_room_student_id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "waiting_room_student_id": waitingRoomStudentId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
