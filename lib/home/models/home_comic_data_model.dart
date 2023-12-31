import 'dart:convert';

class Comic {
  String? error;
  int? limit;
  int? offset;
  int? numberOfPageResults;
  int? numberOfTotalResults;
  int? statusCode;
  List<Result>? results;
  String? version;

  Comic({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory Comic.fromRawJson(String str) => Comic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
    error: json["error"],
    limit: json["limit"],
    offset: json["offset"],
    numberOfPageResults: json["number_of_page_results"],
    numberOfTotalResults: json["number_of_total_results"],
    statusCode: json["status_code"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "limit": limit,
    "offset": offset,
    "number_of_page_results": numberOfPageResults,
    "number_of_total_results": numberOfTotalResults,
    "status_code": statusCode,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "version": version,
  };
}

class Result {
  dynamic aliases;
  String? apiDetailUrl;
  DateTime? coverDate;
  DateTime? dateAdded;
  DateTime? dateLastUpdated;
  dynamic deck;
  String? description;
  bool? hasStaffReview;
  int? id;
  Image? image;
  List<AssociatedImage>? associatedImages;
  String? issueNumber;
  String? name;
  String? siteDetailUrl;
  DateTime? storeDate;
  Volume? volume;

  Result({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    this.id,
    this.image,
    this.associatedImages,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    aliases: json["aliases"],
    apiDetailUrl: json["api_detail_url"],
    coverDate: json["cover_date"] == null ? null : DateTime.parse(json["cover_date"]),
    dateAdded: json["date_added"] == null ? null : DateTime.parse(json["date_added"]),
    dateLastUpdated: json["date_last_updated"] == null ? null : DateTime.parse(json["date_last_updated"]),
    deck: json["deck"],
    description: json["description"],
    hasStaffReview: json["has_staff_review"],
    id: json["id"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    associatedImages: json["associated_images"] == null ? [] : List<AssociatedImage>.from(json["associated_images"]!.map((x) => AssociatedImage.fromJson(x))),
    issueNumber: json["issue_number"],
    name: json["name"],
    siteDetailUrl: json["site_detail_url"],
    storeDate: json["store_date"] == null ? null : DateTime.parse(json["store_date"]),
    volume: json["volume"] == null ? null : Volume.fromJson(json["volume"]),
  );

  Map<String, dynamic> toJson() => {
    "aliases": aliases,
    "api_detail_url": apiDetailUrl,
    "cover_date": "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}",
    "date_added": dateAdded?.toIso8601String(),
    "date_last_updated": dateLastUpdated?.toIso8601String(),
    "deck": deck,
    "description": description,
    "has_staff_review": hasStaffReview,
    "id": id,
    "image": image?.toJson(),
    "associated_images": associatedImages == null ? [] : List<dynamic>.from(associatedImages!.map((x) => x.toJson())),
    "issue_number": issueNumber,
    "name": name,
    "site_detail_url": siteDetailUrl,
    "store_date": "${storeDate!.year.toString().padLeft(4, '0')}-${storeDate!.month.toString().padLeft(2, '0')}-${storeDate!.day.toString().padLeft(2, '0')}",
    "volume": volume?.toJson(),
  };
}

class AssociatedImage {
  String? originalUrl;
  int? id;
  dynamic caption;
  ImageTags? imageTags;

  AssociatedImage({
    this.originalUrl,
    this.id,
    this.caption,
    this.imageTags,
  });

  factory AssociatedImage.fromRawJson(String str) => AssociatedImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssociatedImage.fromJson(Map<String, dynamic> json) => AssociatedImage(
    originalUrl: json["original_url"],
    id: json["id"],
    caption: json["caption"],
    imageTags: imageTagsValues.map[json["image_tags"]]!,
  );

  Map<String, dynamic> toJson() => {
    "original_url": originalUrl,
    "id": id,
    "caption": caption,
    "image_tags": imageTagsValues.reverse[imageTags],
  };
}

enum ImageTags {
  ALL_IMAGES
}

final imageTagsValues = EnumValues({
  "All Images": ImageTags.ALL_IMAGES
});

class Image {
  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  ImageTags? imageTags;

  Image({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    iconUrl: json["icon_url"],
    mediumUrl: json["medium_url"],
    screenUrl: json["screen_url"],
    screenLargeUrl: json["screen_large_url"],
    smallUrl: json["small_url"],
    superUrl: json["super_url"],
    thumbUrl: json["thumb_url"],
    tinyUrl: json["tiny_url"],
    originalUrl: json["original_url"],
    imageTags: imageTagsValues.map[json["image_tags"]]!,
  );

  Map<String, dynamic> toJson() => {
    "icon_url": iconUrl,
    "medium_url": mediumUrl,
    "screen_url": screenUrl,
    "screen_large_url": screenLargeUrl,
    "small_url": smallUrl,
    "super_url": superUrl,
    "thumb_url": thumbUrl,
    "tiny_url": tinyUrl,
    "original_url": originalUrl,
    "image_tags": imageTagsValues.reverse[imageTags],
  };
}

class Volume {
  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;

  Volume({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  factory Volume.fromRawJson(String str) => Volume.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
    apiDetailUrl: json["api_detail_url"],
    id: json["id"],
    name: json["name"],
    siteDetailUrl: json["site_detail_url"],
  );

  Map<String, dynamic> toJson() => {
    "api_detail_url": apiDetailUrl,
    "id": id,
    "name": name,
    "site_detail_url": siteDetailUrl,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
