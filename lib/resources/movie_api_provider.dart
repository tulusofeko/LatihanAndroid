import 'dart:convert';

import 'package:flutter_app/models/m_list_movie.dart';
import 'package:http/http.dart';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = "761874380224801b58971e5068250342";
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<MListMovieModel> fetchMovieList() async{
    print("==========================> : $_baseUrl/popular?api_key=$_apiKey");
    Response response;
    response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if(response.statusCode == 200){
      return MListMovieModel.fromJason(json.decode(response.body));
    }else{
      throw Exception('Failed Get Data');
    }
  }
}