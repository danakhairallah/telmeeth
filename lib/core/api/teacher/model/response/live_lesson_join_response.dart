// To parse this JSON data, do
//
//     final liveLessonJoinResponse = liveLessonJoinResponseFromJson(jsonString);

import 'dart:convert';

LiveLessonJoinResponse liveLessonJoinResponseFromJson(String str) => LiveLessonJoinResponse.fromJson(json.decode(str));

String liveLessonJoinResponseToJson(LiveLessonJoinResponse data) => json.encode(data.toJson());

class LiveLessonJoinResponse {
    String? room;
    String? iframeUrl;
    String? role;
    dynamic userName;

    LiveLessonJoinResponse({
        this.room,
        this.iframeUrl,
        this.role,
        this.userName,
    });

    factory LiveLessonJoinResponse.fromJson(Map<String, dynamic> json) => LiveLessonJoinResponse(
        room: json["room"],
        iframeUrl: json["iframe_url"],
        role: json["role"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "room": room,
        "iframe_url": iframeUrl,
        "role": role,
        "userName": userName,
    };
}
