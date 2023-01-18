import 'dart:convert';

Search? welcomeFromJson(String str) => Search.fromJson(json.decode(str));

String welcomeToJson(Search? data) => json.encode(data!.toJson());

class Search {
  Search({
    this.albums,
    this.artists,
    this.episodes,
    this.genres,
    this.playlists,
    this.podcasts,
    this.topResults,
    this.users,
  });

  Albums? albums;
  WelcomeArtists? artists;
  Episodes? episodes;
  Albums? genres;
  Playlists? playlists;
  Podcasts? podcasts;
  TopResults? topResults;
  Users? users;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    albums: json["albums"] != null ? Albums.fromJson(json["albums"]) : null,
    artists: json["artists"] != null ?  WelcomeArtists.fromJson(json["artists"]) : null,
    episodes: json["episodes"] != null ? Episodes.fromJson(json["episodes"]) : null,
    genres: json["genres"] != null ? Albums.fromJson(json["genres"]) : null,
    playlists: json["playlists"]!= null ? Playlists.fromJson(json["playlists"]) : null,
    podcasts: json["podcasts"] != null ? Podcasts.fromJson(json["podcasts"]) : null,
    topResults: json["topResults"] != null ? TopResults.fromJson(json["topResults"]) : null,
    users: json["users"] != null ? Users.fromJson(json["users"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "albums": albums!.toJson(),
    "artists": artists!.toJson(),
    "episodes": episodes!.toJson(),
    "genres": genres!.toJson(),
    "playlists": playlists!.toJson(),
    "podcasts": podcasts!.toJson(),
    "topResults": topResults!.toJson(),
    "users": users!.toJson(),
  };
}

class Albums {
  Albums({
    this.totalCount,
    this.items,
  });

  int? totalCount;
  List<AlbumsItem?>? items;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
    totalCount: json["totalCount"],
    items: json["items"] == null ? [] : List<AlbumsItem?>.from(json["items"]!.map((x) => AlbumsItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class AlbumsItem {
  AlbumsItem({
    this.data,
  });

  PurpleData? data;

  factory AlbumsItem.fromJson(Map<String, dynamic> json) => AlbumsItem(
    data: json["data"] != null ? PurpleData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class PurpleData {
  PurpleData({
    this.uri,
    this.name,
    this.artists,
    this.coverArt,
    this.date,
  });

  String? uri;
  String? name;
  DataArtists? artists;
  CoverArt? coverArt;
  Date? date;

  factory PurpleData.fromJson(Map<String, dynamic> json) => PurpleData(
    uri: json["uri"],
    name: json["name"],
    artists: json["artists"] != null ? DataArtists.fromJson(json["artists"]) : null,
    coverArt: json["coverArt"] != null ? CoverArt.fromJson(json["coverArt"]) : null,
    date: json["date"] != null ? Date.fromJson(json["date"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "artists": artists!.toJson(),
    "coverArt": coverArt!.toJson(),
    "date": date!.toJson(),
  };
}

class DataArtists {
  DataArtists({
    this.items,
  });

  List<PurpleItem?>? items;

  factory DataArtists.fromJson(Map<String, dynamic> json) => DataArtists(
    items: json["items"] == null ? [] : List<PurpleItem?>.from(json["items"]!.map((x) => PurpleItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class PurpleItem {
  PurpleItem({
    this.uri,
    this.profile,
  });

  String? uri;
  Profile? profile;

  factory PurpleItem.fromJson(Map<String, dynamic> json) => PurpleItem(
    uri: json["uri"],
    profile: json["profile"] != null ? Profile.fromJson(json["profile"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "profile": profile!.toJson(),
  };
}

class Profile {
  Profile({
    this.name,
  });

  String? name;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
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
  });

  int? year;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
  };
}

class WelcomeArtists {
  WelcomeArtists({
    this.totalCount,
    this.items,
  });

  int? totalCount;
  List<FluffyItem?>? items;

  factory WelcomeArtists.fromJson(Map<String, dynamic> json) => WelcomeArtists(
    totalCount: json["totalCount"],
    items: json["items"] == null ? [] : List<FluffyItem?>.from(json["items"]!.map((x) => FluffyItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class FluffyItem {
  FluffyItem({
    this.data,
  });

  FluffyData? data;

  factory FluffyItem.fromJson(Map<String, dynamic> json) => FluffyItem(
    data: FluffyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class FluffyData {
  FluffyData({
    this.uri,
    this.profile,
    this.visuals,
  });

  String? uri;
  Profile? profile;
  Visuals? visuals;

  factory FluffyData.fromJson(Map<String, dynamic> json) => FluffyData(
    uri: json["uri"],
    profile: json["profile"] != null ? Profile.fromJson(json["profile"]) : null,
    visuals: json["visuals"] != null ? Visuals.fromJson(json["visuals"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "profile": profile!.toJson(),
    "visuals": visuals!.toJson(),
  };
}

class Visuals {
  Visuals({
    this.avatarImage,
  });

  CoverArt? avatarImage;

  factory Visuals.fromJson(Map<String, dynamic> json) => Visuals(
    avatarImage:json["avatarImage"]!= null ? CoverArt.fromJson(json["avatarImage"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "avatarImage": avatarImage!.toJson(),
  };
}

class Episodes {
  Episodes({
    this.totalCount,
    this.items,
  });

  int? totalCount;
  List<EpisodesItem?>? items;

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
    totalCount: json["totalCount"],
    items: json["items"] == null ? [] : List<EpisodesItem?>.from(json["items"]!.map((x) => EpisodesItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class EpisodesItem {
  EpisodesItem({
    this.data,
  });

  TentacledData? data;

  factory EpisodesItem.fromJson(Map<String, dynamic> json) => EpisodesItem(
    data: json["data"] != null ? TentacledData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class TentacledData {
  TentacledData({
    this.uri,
    this.name,
    this.coverArt,
    this.duration,
    this.releaseDate,
    this.podcast,
    this.description,
    this.contentRating,
  });

  String? uri;
  String? name;
  CoverArt? coverArt;
  Duration? duration;
  ReleaseDate? releaseDate;
  PodcastClass? podcast;
  String? description;
  ContentRating? contentRating;

  factory TentacledData.fromJson(Map<String, dynamic> json) => TentacledData(
    uri: json["uri"],
    name: json["name"],
    coverArt:json["coverArt"]!= null ? CoverArt.fromJson(json["coverArt"]) : null,
    duration:json["duration"]!= null ? Duration.fromJson(json["duration"]) : null,
    releaseDate:json["releaseDate"] != null ? ReleaseDate.fromJson(json["releaseDate"]) : null,
    podcast:json["podcast"]!= null ? PodcastClass.fromJson(json["podcast"]) : null,
    description: json["description"],
    contentRating:json["contentRating"] != null ? ContentRating.fromJson(json["contentRating"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "coverArt": coverArt!.toJson(),
    "duration": duration!.toJson(),
    "releaseDate": releaseDate!.toJson(),
    "podcast": podcast!.toJson(),
    "description": description,
    "contentRating": contentRating!.toJson(),
  };
}

class ContentRating {
  ContentRating({
    this.label,
  });

  String? label;

  factory ContentRating.fromJson(Map<String, dynamic> json) => ContentRating(
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
  };
}

class Duration {
  Duration({
    this.totalMilliseconds,
  });

  int? totalMilliseconds;

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
    totalMilliseconds: json["totalMilliseconds"],
  );

  Map<String, dynamic> toJson() => {
    "totalMilliseconds": totalMilliseconds,
  };
}

class PodcastClass {
  PodcastClass({
    this.uri,
    this.name,
    this.coverArt,
    this.type,
    this.publisher,
    this.mediaType,
  });

  String? uri;
  String? name;
  CoverArt? coverArt;
  String? type;
  Profile? publisher;
  String? mediaType;

  factory PodcastClass.fromJson(Map<String, dynamic> json) => PodcastClass(
    uri: json["uri"],
    name: json["name"],
    coverArt:json["coverArt"] != null ? CoverArt.fromJson(json["coverArt"]) : null,
    type: json["type"],
    publisher: json["publisher"] != null ? Profile.fromJson(json["publisher"]) : null,
    mediaType: json["mediaType"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "coverArt": coverArt!.toJson(),
    "type": type,
    "publisher": publisher!.toJson(),
    "mediaType": mediaType,
  };
}

class ReleaseDate {
  ReleaseDate({
    this.isoString,
    this.precision,
  });

  DateTime? isoString;
  String? precision;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
    isoString:json["isoString"]!= null ? DateTime.parse(json["isoString"]) : null,
    precision: json["precision"],
  );

  Map<String, dynamic> toJson() => {
    "isoString": isoString?.toIso8601String(),
    "precision": precision,
  };
}

class Playlists {
  Playlists({
    this.totalCount,
    this.items,
  });

  int? totalCount;
  List<FeaturedElement?>? items;

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
    totalCount: json["totalCount"],
    items: json["items"] == null ? [] : List<FeaturedElement?>.from(json["items"]!.map((x) => FeaturedElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class FeaturedElement {
  FeaturedElement({
    this.data,
  });

  FeaturedData? data;

  factory FeaturedElement.fromJson(Map<String, dynamic> json) => FeaturedElement(
    data:json["data"] != null ? FeaturedData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class FeaturedData {
  FeaturedData({
    this.uri,
    this.name,
    this.description,
    this.images,
    this.owner,
  });

  String? uri;
  String? name;
  String? description;
  Images? images;
  Owner? owner;

  factory FeaturedData.fromJson(Map<String, dynamic> json) => FeaturedData(
    uri: json["uri"],
    name: json["name"],
    description: json["description"],
    images:json["images"] != null ? Images.fromJson(json["images"]) : null,
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "description": description,
    "images": images!.toJson(),
    "owner": owner!.toJson(),
  };
}

class Images {
  Images({
    this.items,
  });

  List<CoverArt?>? items;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    items: json["items"] == null ? [] : List<CoverArt?>.from(json["items"]!.map((x) => CoverArt.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class Owner {
  Owner({
    this.name,
    this.uri,
    this.username,
  });

  String? name;
  String? uri;
  String? username;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    name: json["name"],
    uri: json["uri"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "uri": uri,
    "username": username,
  };
}

class Podcasts {
  Podcasts({
    this.totalCount,
    this.items,
  });

  int? totalCount;
  List<PodcastsItem?>? items;

  factory Podcasts.fromJson(Map<String, dynamic> json) => Podcasts(
    totalCount: json["totalCount"],
    items: json["items"] == null ? [] : List<PodcastsItem?>.from(json["items"]!.map((x) => PodcastsItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class PodcastsItem {
  PodcastsItem({
    this.data,
  });

  PodcastClass? data;

  factory PodcastsItem.fromJson(Map<String, dynamic> json) => PodcastsItem(
    data: json["data"] != null ? PodcastClass.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class TopResults {
  TopResults({
    this.featured,
  });

  List<FeaturedElement?>? featured;

  factory TopResults.fromJson(Map<String, dynamic> json) => TopResults(

    featured: json["featured"] == null ? [] : List<FeaturedElement?>.from(json["featured"]!.map((x) => FeaturedElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {

    "featured": featured == null ? [] : List<dynamic>.from(featured!.map((x) => x!.toJson())),
  };
}



class AlbumOfTrack {
  AlbumOfTrack({
    this.uri,
    this.name,
    this.coverArt,
    this.id,
  });

  String? uri;
  String? name;
  CoverArt? coverArt;
  String? id;

  factory AlbumOfTrack.fromJson(Map<String, dynamic> json) => AlbumOfTrack(
    uri: json["uri"],
    name: json["name"],
    coverArt: json["coverArt"] != null ? CoverArt.fromJson(json["coverArt"]) : null,
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "name": name,
    "coverArt": coverArt!.toJson(),
    "id": id,
  };
}

class Playability {
  Playability({
    this.playable,
  });

  bool? playable;

  factory Playability.fromJson(Map<String, dynamic> json) => Playability(
    playable: json["playable"],
  );

  Map<String, dynamic> toJson() => {
    "playable": playable,
  };
}

class Users {
  Users({
    this.totalCount,
    this.items,
  });

  int? totalCount;
  List<UsersItem?>? items;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    totalCount: json["totalCount"],
    items: json["items"] == null ? [] : List<UsersItem?>.from(json["items"]!.map((x) => UsersItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
  };
}

class UsersItem {
  UsersItem({
    this.data,
  });

  StickyData? data;

  factory UsersItem.fromJson(Map<String, dynamic> json) => UsersItem(
    data: json["data"] != null ? StickyData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class StickyData {
  StickyData({
    this.uri,
    this.id,
    this.displayName,
    this.username,
    this.image,
  });

  String? uri;
  String? id;
  String? displayName;
  String? username;
  Image? image;

  factory StickyData.fromJson(Map<String, dynamic> json) => StickyData(
    uri: json["uri"],
    id: json["id"],
    displayName: json["displayName"],
    username: json["username"],
    image: json["image"] != null ? Image.fromJson(json["image"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "uri": uri,
    "id": id,
    "displayName": displayName,
    "username": username,
    "image": image!.toJson(),
  };
}

class Image {
  Image({
    this.smallImageUrl,
    this.largeImageUrl,
  });

  String? smallImageUrl;
  String? largeImageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    smallImageUrl: json["smallImageUrl"],
    largeImageUrl: json["largeImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "smallImageUrl": smallImageUrl,
    "largeImageUrl": largeImageUrl,
  };
}
