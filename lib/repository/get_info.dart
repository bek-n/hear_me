import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/artists.dart';
import '../model/playlist.dart';

abstract class GetInfo {
  GetInfo._();

  static Future<Playlist?> getPlaylist() async {
    try {
      final url = Uri.parse(
          "https://spotify81.p.rapidapi.com/playlist?id=37i9dQZF1DX4Wsb4d7NKfP");

      final res = await http.get(url, headers: {
        'X-RapidAPI-Key': '91d31d4cb8mshdd2eaed2c3bf3b5p1bc6d3jsn9e4eb668d330',
        'X-RapidAPI-Host': 'spotify81.p.rapidapi.com'
      });
      print(res.body);
      print(res.statusCode);
      print(playlistFromJson(res.body));
      return playlistFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Artists?> getArtists() async {
    try {
      final url = Uri.parse("https://spotify81.p.rapidapi.com/artists?ids=2w9zwq3AktTeYYMuhMjju8");

      final res = await http.get(url, headers: {
        'X-RapidAPI-Key': '91d31d4cb8mshdd2eaed2c3bf3b5p1bc6d3jsn9e4eb668d330',
        'X-RapidAPI-Host': 'spotify81.p.rapidapi.com'
      });
      print(res.body);
      print(res.statusCode);
      print(artistsFromJson(res.body));
      return artistsFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
