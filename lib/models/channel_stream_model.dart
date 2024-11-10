// To parse this JSON data, do
//
//     final channelStream = channelStreamFromJson(jsonString);

import 'dart:convert';

Map<String, ChannelStreamModel> channelStreamFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, ChannelStreamModel>(k, ChannelStreamModel.fromJson(v)));

String channelStreamToJson(Map<String, ChannelStreamModel> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class ChannelStreamModel {
    String url;
    String id;
    String name;
    List<String> altNames;
    String? network;
    List<String> owners;
    String country;
    String? subdivision;
    String? city;
    List<String> broadcastArea;
    List<String> languages;
    List<Category> categories;
    bool isNsfw;
    DateTime? launched;
    DateTime? closed;
    String? replacedBy;
    String? website;
    String logo;

    ChannelStreamModel({
        required this.url,
        required this.id,
        required this.name,
        required this.altNames,
        required this.network,
        required this.owners,
        required this.country,
        required this.subdivision,
        required this.city,
        required this.broadcastArea,
        required this.languages,
        required this.categories,
        required this.isNsfw,
        required this.launched,
        required this.closed,
        required this.replacedBy,
        required this.website,
        required this.logo,
    });

    factory ChannelStreamModel.fromJson(Map<String, dynamic> json) => ChannelStreamModel(
        url: json["url"],
        id: json["id"],
        name: json["name"],
        altNames: List<String>.from(json["alt_names"].map((x) => x)),
        network: json["network"],
        owners: List<String>.from(json["owners"].map((x) => x)),
        country: json["country"],
        subdivision: json["subdivision"],
        city: json["city"],
        broadcastArea: List<String>.from(json["broadcast_area"].map((x) => x)),
        languages: List<String>.from(json["languages"].map((x) => x)),
        categories: List<Category>.from(json["categories"].map((x) => categoryValues.map[x]!)),
        isNsfw: json["is_nsfw"],
        launched: json["launched"] == null ? null : DateTime.parse(json["launched"]),
        closed: json["closed"] == null ? null : DateTime.parse(json["closed"]),
        replacedBy: json["replaced_by"],
        website: json["website"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "name": name,
        "alt_names": List<dynamic>.from(altNames.map((x) => x)),
        "network": network,
        "owners": List<dynamic>.from(owners.map((x) => x)),
        "country": country,
        "subdivision": subdivision,
        "city": city,
        "broadcast_area": List<dynamic>.from(broadcastArea.map((x) => x)),
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => categoryValues.reverse[x])),
        "is_nsfw": isNsfw,
        "launched": "${launched!.year.toString().padLeft(4, '0')}-${launched!.month.toString().padLeft(2, '0')}-${launched!.day.toString().padLeft(2, '0')}",
        "closed": "${closed!.year.toString().padLeft(4, '0')}-${closed!.month.toString().padLeft(2, '0')}-${closed!.day.toString().padLeft(2, '0')}",
        "replaced_by": replacedBy,
        "website": website,
        "logo": logo,
    };
}

enum Category {
    ANIMATION,
    AUTO,
    BUSINESS,
    CLASSIC,
    COMEDY,
    COOKING,
    CULTURE,
    DOCUMENTARY,
    EDUCATION,
    ENTERTAINMENT,
    FAMILY,
    GENERAL,
    KIDS,
    LEGISLATIVE,
    LIFESTYLE,
    MOVIES,
    MUSIC,
    NEWS,
    OUTDOOR,
    RELAX,
    RELIGIOUS,
    SCIENCE,
    SERIES,
    SHOP,
    SPORTS,
    TRAVEL,
    WEATHER,
    XXX
}

final categoryValues = EnumValues({
    "animation": Category.ANIMATION,
    "auto": Category.AUTO,
    "business": Category.BUSINESS,
    "classic": Category.CLASSIC,
    "comedy": Category.COMEDY,
    "cooking": Category.COOKING,
    "culture": Category.CULTURE,
    "documentary": Category.DOCUMENTARY,
    "education": Category.EDUCATION,
    "entertainment": Category.ENTERTAINMENT,
    "family": Category.FAMILY,
    "general": Category.GENERAL,
    "kids": Category.KIDS,
    "legislative": Category.LEGISLATIVE,
    "lifestyle": Category.LIFESTYLE,
    "movies": Category.MOVIES,
    "music": Category.MUSIC,
    "news": Category.NEWS,
    "outdoor": Category.OUTDOOR,
    "relax": Category.RELAX,
    "religious": Category.RELIGIOUS,
    "science": Category.SCIENCE,
    "series": Category.SERIES,
    "shop": Category.SHOP,
    "sports": Category.SPORTS,
    "travel": Category.TRAVEL,
    "weather": Category.WEATHER,
    "xxx": Category.XXX
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
