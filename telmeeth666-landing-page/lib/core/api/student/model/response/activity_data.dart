
import 'package:telmeeth/core/api/student/model/response/interactive.dart';

class ActivityData {
  Interactive? interactive;
  Interactive? recorded;
  Interactive? live;
  Interactive? overall;

  ActivityData({this.interactive, this.recorded, this.live, this.overall});

  ActivityData.fromJson(Map<String, dynamic> json) {
    interactive = json['interactive'] != null
        ? Interactive.fromJson(json['interactive'])
        : null;
    recorded = json['recorded'] != null
        ? Interactive.fromJson(json['recorded'])
        : null;
    live = json['live'] != null ? Interactive.fromJson(json['live']) : null;
    overall = json['overall'] != null
        ? Interactive.fromJson(json['overall'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (interactive != null) {
      data['interactive'] = interactive!.toJson();
    }
    if (recorded != null) {
      data['recorded'] = recorded!.toJson();
    }
    if (live != null) {
      data['live'] = live!.toJson();
    }
    if (overall != null) {
      data['overall'] = overall!.toJson();
    }
    return data;
  }
}