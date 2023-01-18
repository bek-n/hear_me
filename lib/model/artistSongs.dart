

import 'dart:convert';

Artistsongs? artistsongsFromJson(String str) => Artistsongs.fromJson(json.decode(str));

String artistsongsToJson(Artistsongs? data) => json.encode(data!.toJson());

class Artistsongs {
    Artistsongs({
        this.data,
        this.extensions,
    });

    Data? data;
    Extensions? extensions;

    factory Artistsongs.fromJson(Map<String, dynamic> json) => Artistsongs(
        data: Data.fromJson(json["data"]),
        extensions: Extensions.fromJson(json["extensions"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "extensions": extensions!.toJson(),
    };
}

class Data {
    Data({
        this.artist,
    });

    Artist? artist;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        artist: Artist.fromJson(json["artist"]),
    );

    Map<String, dynamic> toJson() => {
        "artist": artist!.toJson(),
    };
}

class Artist {
    Artist({
        this.discography,
    });

    Discography? discography;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        discography: Discography.fromJson(json["discography"]),
    );

    Map<String, dynamic> toJson() => {
        "discography": discography!.toJson(),
    };
}

class Discography {
    Discography({
        this.singles,
    });

    Singles? singles;

    factory Discography.fromJson(Map<String, dynamic> json) => Discography(
        singles: Singles.fromJson(json["singles"]),
    );

    Map<String, dynamic> toJson() => {
        "singles": singles!.toJson(),
    };
}

class Singles {
    Singles({
        this.totalCount,
        this.items,
    });

    int? totalCount;
    List<SinglesItem?>? items;

    factory Singles.fromJson(Map<String, dynamic> json) => Singles(
        totalCount: json["totalCount"],
        items: json["items"] == null ? [] : List<SinglesItem?>.from(json["items"]!.map((x) => SinglesItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
    };
}

class SinglesItem {
    SinglesItem({
        this.releases,
    });

    Releases? releases;

    factory SinglesItem.fromJson(Map<String, dynamic> json) => SinglesItem(
        releases: Releases.fromJson(json["releases"]),
    );

    Map<String, dynamic> toJson() => {
        "releases": releases!.toJson(),
    };
}

class Releases {
    Releases({
        this.items,
    });

    List<ReleasesItem?>? items;

    factory Releases.fromJson(Map<String, dynamic> json) => Releases(
        items: json["items"] == null ? [] : List<ReleasesItem?>.from(json["items"]!.map((x) => ReleasesItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
    };
}

class ReleasesItem {
    ReleasesItem({
        this.id,
        this.uri,
        this.name,
        this.type,
        this.date,
        this.coverArt,
        this.playability,
        this.sharingInfo,
        this.tracks,
    });

    String? id;
    String? uri;
    String? name;
    String? type;
    Date? date;
    CoverArt? coverArt;
    Playability? playability;
    SharingInfo? sharingInfo;
    Tracks? tracks;

    factory ReleasesItem.fromJson(Map<String, dynamic> json) => ReleasesItem(
        id: json["id"],
        uri: json["uri"],
        name: json["name"],
        type: json["type"],
        date: Date.fromJson(json["date"]),
        coverArt: CoverArt.fromJson(json["coverArt"]),
        playability: Playability.fromJson(json["playability"]),
        sharingInfo: SharingInfo.fromJson(json["sharingInfo"]),
        tracks: Tracks.fromJson(json["tracks"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uri": uri,
        "name": name,
        "type": type,
        "date": date!.toJson(),
        "coverArt": coverArt!.toJson(),
        "playability": playability!.toJson(),
        "sharingInfo": sharingInfo!.toJson(),
        "tracks": tracks!.toJson(),
    };
}

class CoverArt {
    CoverArt({
        this.sources,
    });

    List<Source?>? sources;

    factory CoverArt.fromJson(Map<String, dynamic> json) => CoverArt(
        sources: json["sources"] == null ? [] : List<Source?>.from(json["sources"]!.map((x) => Source.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x!.toJson())),
    };
}

class Source {
    Source({
        this.url,
        this.width,
        this.height,
    });

    String? url;
    int? width;
    int? height;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

class Date {
    Date({
        this.year,
        this.isoString,
    });

    int? year;
    DateTime? isoString;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        year: json["year"],
        isoString: DateTime.parse(json["isoString"]),
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "isoString": isoString?.toIso8601String(),
    };
}

class Playability {
    Playability({
        this.playable,
        this.reason,
    });

    bool? playable;
    String? reason;

    factory Playability.fromJson(Map<String, dynamic> json) => Playability(
        playable: json["playable"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "playable": playable,
        "reason": reason,
    };
}

class SharingInfo {
    SharingInfo({
        this.shareId,
        this.shareUrl,
    });

    String? shareId;
    String? shareUrl;

    factory SharingInfo.fromJson(Map<String, dynamic> json) => SharingInfo(
        shareId: json["shareId"],
        shareUrl: json["shareUrl"],
    );

    Map<String, dynamic> toJson() => {
        "shareId": shareId,
        "shareUrl": shareUrl,
    };
}

class Tracks {
    Tracks({
        this.totalCount,
    });

    int? totalCount;

    factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        totalCount: json["totalCount"],
    );

    Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
    };
}

class Extensions {
    Extensions({
        this.cacheControl,
    });

    CacheControl? cacheControl;

    factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
        cacheControl: CacheControl.fromJson(json["cacheControl"]),
    );

    Map<String, dynamic> toJson() => {
        "cacheControl": cacheControl!.toJson(),
    };
}

class CacheControl {
    CacheControl({
        this.version,
        this.hints,
    });

    int? version;
    List<dynamic>? hints;

    factory CacheControl.fromJson(Map<String, dynamic> json) => CacheControl(
        version: json["version"],
        hints: json["hints"] == null ? [] : List<dynamic>.from(json["hints"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "hints": hints == null ? [] : List<dynamic>.from(hints!.map((x) => x)),
    };
}
