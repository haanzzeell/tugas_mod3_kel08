import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugas_mod3_kel08/models/detail_model.dart';
import 'package:tugas_mod3_kel08/models/top_airing.dart';
import 'package:tugas_mod3_kel08/models/top_anime.dart';

class API_Manager {
  Future<AnimeModel> getAnime() async {
    var client = http.Client();
    var animeModel;

    try {
      var response =
          await client.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        animeModel = AnimeModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return animeModel;
    }

    return animeModel;
  }

  Future<AiringModel> getAiring() async {
    var client = http.Client();
    var airingModel;

    try {
      var response = await client
          .get(Uri.parse('https://api.jikan.moe/v3/top/anime/1/airing'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        airingModel = AiringModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return airingModel;
    }

    return airingModel;
  }

  Future<DetailModel> getDetail(id) async {
    var client = http.Client();
    var detailModel;

    try {
      var response =
          await client.get(Uri.parse('https://api.jikan.moe/v3/anime/$id'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        detailModel = DetailModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return detailModel;
    }

    return detailModel;
  }
}
