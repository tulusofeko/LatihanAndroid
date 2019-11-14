import 'package:flutter_app/models/m_list_movie.dart';
import 'package:flutter_app/resources/movie_api_provider.dart';

class Repository{
  final movieProvider = MovieApiProvider();
  Future<MListMovieModel> fetchDataMovie() => movieProvider.fetchMovieList();
}
