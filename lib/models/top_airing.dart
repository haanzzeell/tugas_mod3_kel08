// To parse this JSON data, do
//
//     final airingModel = airingModelFromJson(jsonString);

import 'dart:convert';

AiringModel airingModelFromJson(String str) =>
    AiringModel.fromJson(json.decode(str));

String airingModelToJson(AiringModel data) => json.encode(data.toJson());

class AiringModel {
  AiringModel({
    required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.top,
  });

  String? requestHash;
  bool? requestCached;
  int? requestCacheExpiry;
  List<Top> top;

  factory AiringModel.fromJson(Map<String, dynamic> json) => AiringModel(
        requestHash: json["request_hash"],
        requestCached: json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"],
        top: List<Top>.from(json["top"].map((x) => Top.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "request_hash": requestHash,
        "request_cached": requestCached,
        "request_cache_expiry": requestCacheExpiry,
        "top": List<dynamic>.from(top.map((x) => x.toJson())),
      };
}

class Top {
  Top({
    required this.malId,
    required this.rank,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.type,
    required this.episodes,
    required this.startDate,
    required this.endDate,
    required this.members,
    required this.score,
  });

  int malId;
  int? rank;
  String title;
  String? url;
  String imageUrl;
  Type? type;
  int? episodes;
  String? startDate;
  String? endDate;
  int? members;
  double? score;

  factory Top.fromJson(Map<String, dynamic> json) => Top(
        malId: json["mal_id"],
        rank: json["rank"],
        title: json["title"],
        url: json["url"],
        imageUrl: json["image_url"],
        type: typeValues.map[json["type"]],
        episodes: json["episodes"] == null ? null : json["episodes"],
        startDate: json["start_date"],
        endDate: json["end_date"] == null ? null : json["end_date"],
        members: json["members"],
        score: json["score"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "rank": rank,
        "title": title,
        "url": url,
        "image_url": imageUrl,
        "type": typeValues.reverse[type],
        "episodes": episodes == null ? null : episodes,
        "start_date": startDate,
        "end_date": endDate == null ? null : endDate,
        "members": members,
        "score": score,
      };
}

enum Type { TV, ONA, SPECIAL, OVA }

final typeValues = EnumValues(
    {"ONA": Type.ONA, "OVA": Type.OVA, "Special": Type.SPECIAL, "TV": Type.TV});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
