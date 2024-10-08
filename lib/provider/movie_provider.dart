import 'dart:convert';

import 'package:lati_marvel_movies/model/movies_model.dart';
import 'package:lati_marvel_movies/provider/base_provoder.dart';

class MovieProvider extends BaseProvider {
  List<MoviesModel> listmovies = [];

  getMovies() async {
    setProcess(true);
    final response =
        await api.getRequest("https://mcuapi.herokuapp.com/api/v1/movies");
    if (response.statusCode == 200) {
      setError(false);
      var decodedData = json.decode(response.body)['data'];

// the two piece of code has the same functionality
//
//
      // for (var x in decodedData) {
      //   listmovies.add(MoviesModel.fromJson(x));
      // }

      listmovies = List<MoviesModel>.from(
          decodedData.map((item) => MoviesModel.fromJson(item))).toList();
    } else {
      setError(true);
    }
    setProcess(false);
  }
}
