import 'dart:convert';

Artists? artistsFromJson(String str) => Artists.fromJson(json.decode(str));

String artistsToJson(Artists? data) => json.encode(data!.toJson());

class Artists {
    Artists({
        this.artists,
    });

    List<Artist?>? artists;

    factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        artists: json["artists"] == null ? [] : List<Artist?>.from(json["artists"]!.map((x) => Artist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x!.toJson())),
    };
}

class Artist {
    Artist({
        
       
        this.genres,
        this.href,
        this.id,
        this.images,
        this.name,
        this.popularity,
        this.type,
        this.uri,
    });

   
   
    List<String?>? genres;
    String? href;
    String? id;
    List<Image?>? images;
    String? name;
    int? popularity;
    String? type;
    String? uri;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
     
       
        genres: json["genres"] == null ? [] : List<String?>.from(json["genres"]!.map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null ? [] : List<Image?>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
       
       
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "href": href,
        "id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x!.toJson())),
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
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
