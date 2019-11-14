import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/movie_bloc.dart';
import 'package:flutter_app/models/m_list_movie.dart';

import 'detail_movie.dart';

class ListMovie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListMovieState();
  }
}

class ListMovieState extends State<ListMovie> {
  final bloc = MovieBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Movie'),
        ),
        body: StreamBuilder(
          builder:
              (BuildContext context, AsyncSnapshot<MListMovieModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          stream: bloc.allMovie,
        ));
  }

  Widget buildList(AsyncSnapshot<MListMovieModel> snapshot) {
    return GridView.builder(
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.65),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: GestureDetector(
              child: Card(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                  height: 290,
                  fit: BoxFit.fill,
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DetailMovie(
                    photoMovie:
                    'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                    data: snapshot.data.results[index].title,
                    description: snapshot.data.results[index].overview
                        .substring(0, 20),
                    sinopsis: snapshot.data.results[index].overview,
                  );
                }),
              ) //Navigation ke Detail Movie,
          ),
        );
      },
      itemCount: snapshot.data.results.length,
    );
  }
}