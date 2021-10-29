// To parse this JSON data, do
//
//     final detailModel = detailModelFromJson(jsonString);

import 'dart:convert';

DetailModel detailModelFromJson(String str) =>
    DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  DetailModel({
    required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.trailerUrl,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.premiered,
    required this.broadcast,
    required this.related,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.demographics,
    required this.themes,
    required this.openingThemes,
    required this.endingThemes,
    required this.externalLinks,
  });

  String? requestHash;
  bool? requestCached;
  int? requestCacheExpiry;
  int? malId;
  String? url;
  String? imageUrl;
  String? trailerUrl;
  String title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  dynamic background;
  String? premiered;
  String? broadcast;
  Related? related;
  List<Demographic>? producers;
  List<Demographic>? licensors;
  List<Demographic>? studios;
  List<Demographic>? genres;
  List<dynamic>? explicitGenres;
  List<Demographic>? demographics;
  List<Demographic>? themes;
  List<String>? openingThemes;
  List<String>? endingThemes;
  List<ExternalLink>? externalLinks;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        requestHash: json["request_hash"] == null ? null : json["request_hash"],
        requestCached:
            json["request_cached"] == null ? null : json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"] == null
            ? null
            : json["request_cache_expiry"],
        malId: json["mal_id"] == null ? null : json["mal_id"],
        url: json["url"] == null ? null : json["url"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        trailerUrl: json["trailer_url"] == null ? null : json["trailer_url"],
        title: json["title"] == null ? null : json["title"],
        titleEnglish:
            json["title_english"] == null ? null : json["title_english"],
        titleJapanese:
            json["title_japanese"] == null ? null : json["title_japanese"],
        titleSynonyms: json["title_synonyms"] == null
            ? null
            : List<String>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"] == null ? null : json["type"],
        source: json["source"] == null ? null : json["source"],
        episodes: json["episodes"] == null ? null : json["episodes"],
        status: json["status"] == null ? null : json["status"],
        airing: json["airing"] == null ? null : json["airing"],
        aired: json["aired"] == null ? null : Aired.fromJson(json["aired"]),
        duration: json["duration"] == null ? null : json["duration"],
        rating: json["rating"] == null ? null : json["rating"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        scoredBy: json["scored_by"] == null ? null : json["scored_by"],
        rank: json["rank"] == null ? null : json["rank"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        members: json["members"] == null ? null : json["members"],
        favorites: json["favorites"] == null ? null : json["favorites"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        background: json["background"],
        premiered: json["premiered"] == null ? null : json["premiered"],
        broadcast: json["broadcast"] == null ? null : json["broadcast"],
        related:
            json["related"] == null ? null : Related.fromJson(json["related"]),
        producers: json["producers"] == null
            ? null
            : List<Demographic>.from(
                json["producers"].map((x) => Demographic.fromJson(x))),
        licensors: json["licensors"] == null
            ? null
            : List<Demographic>.from(
                json["licensors"].map((x) => Demographic.fromJson(x))),
        studios: json["studios"] == null
            ? null
            : List<Demographic>.from(
                json["studios"].map((x) => Demographic.fromJson(x))),
        genres: json["genres"] == null
            ? null
            : List<Demographic>.from(
                json["genres"].map((x) => Demographic.fromJson(x))),
        explicitGenres: json["explicit_genres"] == null
            ? null
            : List<dynamic>.from(json["explicit_genres"].map((x) => x)),
        demographics: json["demographics"] == null
            ? null
            : List<Demographic>.from(
                json["demographics"].map((x) => Demographic.fromJson(x))),
        themes: json["themes"] == null
            ? null
            : List<Demographic>.from(
                json["themes"].map((x) => Demographic.fromJson(x))),
        openingThemes: json["opening_themes"] == null
            ? null
            : List<String>.from(json["opening_themes"].map((x) => x)),
        endingThemes: json["ending_themes"] == null
            ? null
            : List<String>.from(json["ending_themes"].map((x) => x)),
        externalLinks: json["external_links"] == null
            ? null
            : List<ExternalLink>.from(
                json["external_links"].map((x) => ExternalLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "request_hash": requestHash == null ? null : requestHash,
        "request_cached": requestCached == null ? null : requestCached,
        "request_cache_expiry":
            requestCacheExpiry == null ? null : requestCacheExpiry,
        "mal_id": malId == null ? null : malId,
        "url": url == null ? null : url,
        "image_url": imageUrl == null ? null : imageUrl,
        "trailer_url": trailerUrl == null ? null : trailerUrl,
        "title": title == null ? null : title,
        "title_english": titleEnglish == null ? null : titleEnglish,
        "title_japanese": titleJapanese == null ? null : titleJapanese,
        "title_synonyms": titleSynonyms == null
            ? null
            : List<dynamic>.from(titleSynonyms!.map((x) => x)),
        "type": type == null ? null : type,
        "source": source == null ? null : source,
        "episodes": episodes == null ? null : episodes,
        "status": status == null ? null : status,
        "airing": airing == null ? null : airing,
        "aired": aired == null ? null : aired!.toJson(),
        "duration": duration == null ? null : duration,
        "rating": rating == null ? null : rating,
        "score": score == null ? null : score,
        "scored_by": scoredBy == null ? null : scoredBy,
        "rank": rank == null ? null : rank,
        "popularity": popularity == null ? null : popularity,
        "members": members == null ? null : members,
        "favorites": favorites == null ? null : favorites,
        "synopsis": synopsis == null ? null : synopsis,
        "background": background,
        "premiered": premiered == null ? null : premiered,
        "broadcast": broadcast == null ? null : broadcast,
        "related": related == null ? null : related!.toJson(),
        "producers": producers == null
            ? null
            : List<dynamic>.from(producers!.map((x) => x.toJson())),
        "licensors": licensors == null
            ? null
            : List<dynamic>.from(licensors!.map((x) => x.toJson())),
        "studios": studios == null
            ? null
            : List<dynamic>.from(studios!.map((x) => x.toJson())),
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "explicit_genres": explicitGenres == null
            ? null
            : List<dynamic>.from(explicitGenres!.map((x) => x)),
        "demographics": demographics == null
            ? null
            : List<dynamic>.from(demographics!.map((x) => x.toJson())),
        "themes": themes == null
            ? null
            : List<dynamic>.from(themes!.map((x) => x.toJson())),
        "opening_themes": openingThemes == null
            ? null
            : List<dynamic>.from(openingThemes!.map((x) => x)),
        "ending_themes": endingThemes == null
            ? null
            : List<dynamic>.from(endingThemes!.map((x) => x)),
        "external_links": externalLinks == null
            ? null
            : List<dynamic>.from(externalLinks!.map((x) => x.toJson())),
      };
}

class Aired {
  Aired({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  DateTime? from;
  DateTime? to;
  Prop? prop;
  String? string;

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        prop: json["prop"] == null ? null : Prop.fromJson(json["prop"]),
        string: json["string"] == null ? null : json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from!.toIso8601String(),
        "to": to == null ? null : to!.toIso8601String(),
        "prop": prop == null ? null : prop!.toJson(),
        "string": string == null ? null : string,
      };
}

class Prop {
  Prop({
    required this.from,
    required this.to,
  });

  From? from;
  From? to;

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: json["from"] == null ? null : From.fromJson(json["from"]),
        to: json["to"] == null ? null : From.fromJson(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from!.toJson(),
        "to": to == null ? null : to!.toJson(),
      };
}

class From {
  From({
    required this.day,
    required this.month,
    required this.year,
  });

  int? day;
  int? month;
  int? year;

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
      };
}

class Demographic {
  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  int? malId;
  Type? type;
  String? name;
  String? url;

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"] == null ? null : json["mal_id"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId == null ? null : malId,
        "type": type == null ? null : typeValues.reverse[type],
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

enum Type { ANIME, MANGA }

final typeValues = EnumValues({"anime": Type.ANIME, "manga": Type.MANGA});

class ExternalLink {
  ExternalLink({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory ExternalLink.fromJson(Map<String, dynamic> json) => ExternalLink(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

class Related {
  Related({
    required this.adaptation,
    required this.alternativeVersion,
    required this.sideStory,
    required this.spinOff,
  });

  List<Demographic>? adaptation;
  List<Demographic>? alternativeVersion;
  List<Demographic>? sideStory;
  List<Demographic>? spinOff;

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        adaptation: json["Adaptation"] == null
            ? null
            : List<Demographic>.from(
                json["Adaptation"].map((x) => Demographic.fromJson(x))),
        alternativeVersion: json["Alternative version"] == null
            ? null
            : List<Demographic>.from(json["Alternative version"]
                .map((x) => Demographic.fromJson(x))),
        sideStory: json["Side story"] == null
            ? null
            : List<Demographic>.from(
                json["Side story"].map((x) => Demographic.fromJson(x))),
        spinOff: json["Spin-off"] == null
            ? null
            : List<Demographic>.from(
                json["Spin-off"].map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Adaptation": adaptation == null
            ? null
            : List<dynamic>.from(adaptation!.map((x) => x.toJson())),
        "Alternative version": alternativeVersion == null
            ? null
            : List<dynamic>.from(alternativeVersion!.map((x) => x.toJson())),
        "Side story": sideStory == null
            ? null
            : List<dynamic>.from(sideStory!.map((x) => x.toJson())),
        "Spin-off": spinOff == null
            ? null
            : List<dynamic>.from(spinOff!.map((x) => x.toJson())),
      };
}

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
