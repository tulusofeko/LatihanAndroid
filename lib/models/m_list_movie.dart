class MListMovieModel{
  int page;
  int total_page;
  int total_result;
  List<MListMovieResult> results;

  MListMovieModel.fromJason(Map<String, dynamic> parseJson){
    page = parseJson['page'];
    total_page = parseJson['total_pages'];
    total_result = parseJson['total_results'];
    List<MListMovieResult> res = [];
    for (int i = 0; i < parseJson['results'].length; i++ ){
      MListMovieResult result = MListMovieResult(parseJson['results'][i]);
      res.add(result);
    }
    results = res;
  }
  List<MListMovieResult> get resultGet => results;
  int get pageGet => page;
  int get totalPageGet => total_page;
  int get totalResultPage => total_result;
}

class MListMovieResult{
  String title;
  String relase_date;
  String poster_path;
  String backdrop_path;
  String overview;

  MListMovieResult(result){
    title = result['title'];
    relase_date = result['relase_date'];
    poster_path = result['poster_path'];
    backdrop_path = result['backdrop_path'];
    overview = result['overview'];
  }

  String get titleGet => title;
  String get relaseGet => relase_date;
  String get posterGet => poster_path;
  String get backdropGet => backdrop_path;
  String get overviewGet => overview;
}
