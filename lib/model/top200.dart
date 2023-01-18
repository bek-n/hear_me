import 'dart:convert';

List<Top200?>? top200FromJson(String str) => json.decode(str) == null ? [] : List<Top200?>.from(json.decode(str)!.map((x) => Top200.fromJson(x)));

String top200ToJson(List<Top200?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Top200 {
    Top200({
        this.chartEntryData,
        this.trackMetadata,
    });

    ChartEntryData? chartEntryData;
    TrackMetadata? trackMetadata;

    factory Top200.fromJson(Map<String, dynamic> json) => Top200(
        chartEntryData: ChartEntryData.fromJson(json["chartEntryData"]),
        trackMetadata: TrackMetadata.fromJson(json["trackMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "chartEntryData": chartEntryData!.toJson(),
        "trackMetadata": trackMetadata!.toJson(),
    };
}

class ChartEntryData {
    ChartEntryData({
        this.currentRank,
        this.previousRank,
        this.peakRank,
        this.appearancesOnChart,
        this.consecutiveAppearancesOnChart,
        this.rankingMetric,
        this.entryStatus,
        this.peakDate,
        this.entryRank,
        this.entryDate,
    });

    int? currentRank;
    int? previousRank;
    int? peakRank;
    int? appearancesOnChart;
    int? consecutiveAppearancesOnChart;
    RankingMetric? rankingMetric;
    String? entryStatus;
    DateTime? peakDate;
    int? entryRank;
    DateTime? entryDate;

    factory ChartEntryData.fromJson(Map<String, dynamic> json) => ChartEntryData(
        currentRank: json["currentRank"],
        previousRank: json["previousRank"],
        peakRank: json["peakRank"],
        appearancesOnChart: json["appearancesOnChart"],
        consecutiveAppearancesOnChart: json["consecutiveAppearancesOnChart"],
        rankingMetric: RankingMetric.fromJson(json["rankingMetric"]),
        entryStatus: json["entryStatus"],
        peakDate: DateTime.parse(json["peakDate"]),
        entryRank: json["entryRank"],
        entryDate: DateTime.parse(json["entryDate"]),
    );

    Map<String, dynamic> toJson() => {
        "currentRank": currentRank,
        "previousRank": previousRank,
        "peakRank": peakRank,
        "appearancesOnChart": appearancesOnChart,
        "consecutiveAppearancesOnChart": consecutiveAppearancesOnChart,
        "rankingMetric": rankingMetric!.toJson(),
        "entryStatus": entryStatus,
        "peakDate": "${peakDate!.year.toString().padLeft(4, '0')}-${peakDate!.month.toString().padLeft(2, '0')}-${peakDate!.day.toString().padLeft(2, '0')}",
        "entryRank": entryRank,
        "entryDate": "${entryDate!.year.toString().padLeft(4, '0')}-${entryDate!.month.toString().padLeft(2, '0')}-${entryDate!.day.toString().padLeft(2, '0')}",
    };
}

class RankingMetric {
    RankingMetric({
        this.value,
        this.type,
    });

    String? value;
    String? type;

    factory RankingMetric.fromJson(Map<String, dynamic> json) => RankingMetric(
        value: json["value"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "type": type,
    };
}

class TrackMetadata {
    TrackMetadata({
        this.trackName,
        this.trackUri,
        this.displayImageUri,
        this.artists,
        this.labels,
        this.releaseDate,
    });

    String? trackName;
    String? trackUri;
    String? displayImageUri;
    List<Artist?>? artists;
    List<Label?>? labels;
    DateTime? releaseDate;

    factory TrackMetadata.fromJson(Map<String, dynamic> json) => TrackMetadata(
        trackName: json["trackName"],
        trackUri: json["trackUri"],
        displayImageUri: json["displayImageUri"],
        artists: json["artists"] == null ? [] : List<Artist?>.from(json["artists"]!.map((x) => Artist.fromJson(x))),
        labels: json["labels"] == null ? [] : List<Label?>.from(json["labels"]!.map((x) => Label.fromJson(x))),
        releaseDate: DateTime.parse(json["releaseDate"]),
    );

    Map<String, dynamic> toJson() => {
        "trackName": trackName,
        "trackUri": trackUri,
        "displayImageUri": displayImageUri,
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x!.toJson())),
        "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x!.toJson())),
        "releaseDate": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    };
}

class Artist {
    Artist({
        this.name,
        this.spotifyUri,
    });

    String? name;
    String? spotifyUri;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        spotifyUri: json["spotifyUri"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "spotifyUri": spotifyUri,
    };
}

class Label {
    Label({
        this.name,
    });

    String? name;

    factory Label.fromJson(Map<String, dynamic> json) => Label(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
