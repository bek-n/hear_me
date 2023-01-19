import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/Search.dart';
import '../model/artistSongs.dart';
import '../model/artists.dart';
import '../model/playlist.dart';
import '../model/top200.dart';

abstract class GetInfo {
  GetInfo._();

  static Future<Playlist?> getPlaylist() async {
    try {
      final url = Uri.parse(
          "https://spotify81.p.rapidapi.com/playlist?id=37i9dQZF1DX4Wsb4d7NKfP");

      final res = await http.get(url, headers: {
        'X-RapidAPI-Key': '8f7674f335mshc466839187b5405p1d3ae4jsn57c9d401092c',
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
      final url = Uri.parse(
          "https://spotify81.p.rapidapi.com/artists?ids=2w9zwq3AktTeYYMuhMjju8");

      final res = await http.get(url, headers: {
        'X-RapidAPI-Key': '8f7674f335mshc466839187b5405p1d3ae4jsn57c9d401092c',
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

  static Future<List<Top200?>?> getTOP() async {
    try {
      final url = Uri.parse("https://spotify81.p.rapidapi.com/top_200_tracks");

      final res = await http.get(url, headers: {
        'X-RapidAPI-Key': '8f7674f335mshc466839187b5405p1d3ae4jsn57c9d401092c',
        'X-RapidAPI-Host': 'spotify81.p.rapidapi.com'
      });
      print(res.body);
      print(res.statusCode);
      print(top200FromJson(res.body));
      return top200FromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Artistsongs?> getArtistssongs() async {
    try {
      final url = Uri.parse(
          "https://spotify81.p.rapidapi.com/artist_singles?id=2w9zwq3AktTeYYMuhMjju8");

      final res = await http.get(url, headers: {
        'X-RapidAPI-Key': '8f7674f335mshc466839187b5405p1d3ae4jsn57c9d401092c',
        'X-RapidAPI-Host': 'spotify81.p.rapidapi.com'
      });
      print(res.body);
      print(res.statusCode);
      print(artistsongsFromJson(res.body));
      return artistsongsFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Search?> getSearch({required String text}) async {
    try {
      final url = Uri.parse('https://spotify81.p.rapidapi.com/search?q=$text&type=multi&offset=0&limit=10&numberOfTopResults=5');
      final res = await http.get(url,  headers: {
        'X-RapidAPI-Key': '8f7674f335mshc466839187b5405p1d3ae4jsn57c9d401092c',
        'X-RapidAPI-Host': 'spotify81.p.rapidapi.com'
      });


      print(res.statusCode);
      print(res.body);

      return welcomeFromJson(res.body);
    } catch (e) {
      print(e);
    }
    return null;
  }
}

//  91d31d4cb8mshdd2eaed2c3bf3b5p1bc6d3jsn9e4eb668d330 !ozimi keyim