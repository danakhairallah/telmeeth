import 'package:telmeeth/core/api/model/response/interactive.dart';

class ActivityData {
  Interactive? interactive;
  Interactive? recorded;
  Interactive? live;
  Interactive? overall;

  ActivityData({this.interactive, this.recorded, this.live, this.overall});

  ActivityData.fromJson(Map<String, dynamic> json) {
    interactive = json['interactive'] != null
        ? new Interactive.fromJson(json['interactive'])
        : null;
    recorded = json['recorded'] != null
        ? new Interactive.fromJson(json['recorded'])
        : null;
    live = json['live'] != null ? new Interactive.fromJson(json['live']) : null;
    overall = json['overall'] != null
        ? new Interactive.fromJson(json['overall'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.interactive != null) {
      data['interactive'] = this.interactive!.toJson();
    }
    if (this.recorded != null) {
      data['recorded'] = this.recorded!.toJson();
    }
    if (this.live != null) {
      data['live'] = this.live!.toJson();
    }
    if (this.overall != null) {
      data['overall'] = this.overall!.toJson();
    }
    return data;
  }
}