import 'dart:convert';

import 'package:lati_marvel_movies/model/movies_model.dart';
import 'package:lati_marvel_movies/provider/base_provoder.dart';

class MovieProvider extends BaseProvider {
  List<MoviesModel> listmovies = [];

  getMovies() async {
    setProcess(true);
    final Response =
        await api.getRequest("https://mcuapi.herokuapp.com/api/v1/movies");
    if (Response.statusCode == 200) {
      var decodedData = json.decode(Response.body)['data'];

      for (var x in decodedData) {
        listmovies.add(MoviesModel.fromJson(x));
      }

      listmovies = List<MoviesModel>.from(
          decodedData.map((item) => MoviesModel.fromJson(item))).toList();
    } else {}
    setProcess(false);
  }
}
