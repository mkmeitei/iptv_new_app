// To parse this JSON data, do
//
//     final unknownChannelModel = unknownChannelModelFromJson(jsonString);

import 'dart:convert';

List<UnknownChannelModel> unknownChannelModelFromJson(String str) => List<UnknownChannelModel>.from(json.decode(str).map((x) => UnknownChannelModel.fromJson(x)));

String unknownChannelModelToJson(List<UnknownChannelModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnknownChannelModel {
    String channel;
    String url;
    String? httpReferrer;
    String? userAgent;

    UnknownChannelModel({
        required this.channel,
        required this.url,
        required this.httpReferrer,
        required this.userAgent,
    });

    factory UnknownChannelModel.fromJson(Map<String, dynamic> json) => UnknownChannelModel(
        channel: json["channel"],
        url: json["url"],
        httpReferrer: json["http_referrer"],
        userAgent: json["user_agent"],
    );

    Map<String, dynamic> toJson() => {
        "channel": channel,
        "url": url,
        "http_referrer": httpReferrer,
        "user_agent": userAgent,
    };
}
