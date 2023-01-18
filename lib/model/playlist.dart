import 'dart:convert';

Playlist? playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist? data) => json.encode(data!.toJson());

class Playlist {
  Playlist({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  List<Image?>? images;
  String? name;
  Owner? owner;
  String? primaryColor;
  bool? public;

  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image?>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls!.toJson(),
        "followers": followers!.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x!.toJson())),
        "name": name,
        "owner": owner!.toJson(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks!.toJson(),
        "type": type,
        "uri": uri,
      };
}

class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  String? spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class Followers {
  Followers({
    this.href,
    this.total,
  });

  dynamic href;
  int? total;

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  int? height;
  String? url;
  int? width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}

class Owner {
  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.name,
  });

  String? displayName;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;
  String? name;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls!.toJson(),
        "href": href,
        "id": id,
        "type": type,
        "uri": uri,
        "name": name,
      };
}

class Tracks {
  Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String? href;
  List<Item?>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        items: json["items"] == null
            ? []
            : List<Item?>.from(json["items"]!.map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x!.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

class Item {
  Item(
      {this.addedAt,
      this.addedBy,
      this.isLocal,
      this.primaryColor,
      this.videoThumbnail,
     });

  DateTime? addedAt;
  Owner? addedBy;
  bool? isLocal;
  dynamic primaryColor;
 
    VideoThumbnail? videoThumbnail;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        addedAt: DateTime.parse(json["added_at"]),
        addedBy: Owner.fromJson(json["added_by"]),
        isLocal: json["is_local"],
        primaryColor: json["primary_color"],
       
        videoThumbnail: VideoThumbnail.fromJson(json["video_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "added_at": addedAt?.toIso8601String(),
        "added_by": addedBy!.toJson(),
        "is_local": isLocal,
        "primary_color": primaryColor,
       
        "video_thumbnail": videoThumbnail!.toJson(),
      };
}



class Album {
  Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  String? albumType;
  List<Owner?>? artists;
  List<String?>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image?>? images;
  String? name;
  DateTime? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists: json["artists"] == null
            ? []
            : List<Owner?>.from(json["artists"]!.map((x) => Owner.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String?>.from(json["available_markets"]!.map((x) => x)),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image?>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x!.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "external_urls": externalUrls!.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x!.toJson())),
        "name": name,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
      };
}

class ExternalIds {
  ExternalIds({
    this.isrc,
  });

  String? isrc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
      };
}

class VideoThumbnail {
  VideoThumbnail({
    this.url,
  });

  dynamic url;

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
