import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/services/api/api.dart';

class BaseProvider with ChangeNotifier{
  Api api = Api();
  bool process = false;
  bool  error = false;

  setProcess(bool value)
  {
    process = value;
    notifyListeners();
  }

  setError(bool value){
  error = value;
  notifyListeners();
}
}


