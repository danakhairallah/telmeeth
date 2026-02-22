// To parse this JSON data, do
//
//     final restoreStreakModel = restoreStreakModelFromJson(jsonString);

import 'dart:convert';

RestoreStreakModel restoreStreakModelFromJson(String str) => RestoreStreakModel.fromJson(json.decode(str));

String restoreStreakModelToJson(RestoreStreakModel data) => json.encode(data.toJson());

class RestoreStreakModel {
    bool? status;
    String? message;
    int? streak;
    int? restoresUsed;

    RestoreStreakModel({
        this.status,
        this.message,
        this.streak,
        this.restoresUsed,
    });

    factory RestoreStreakModel.fromJson(Map<String, dynamic> json) => RestoreStreakModel(
        status: json["status"],
        message: json["message"],
        streak: json["streak"],
        restoresUsed: json["restores_used"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "streak": streak,
        "restores_used": restoresUsed,
    };
}
