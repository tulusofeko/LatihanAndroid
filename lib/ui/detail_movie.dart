import 'package:flutter/material.dart';

class DetailMovie extends StatefulWidget{
  final String data;
  final String description;
  final String sinopsis;
  final String photoMovie;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailMovieState();
  }

  DetailMovie(
      {this.data, this.description, this.sinopsis, this.photoMovie});
}

class DetailMovieState extends State<DetailMovie>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
//        centerTitle: true,
        title: Text('Detail Movie'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: Image.network(
                widget.photoMovie,
                height: 200,
                fit: BoxFit.fill,
              ),
            width: double.infinity,
          ),
          Text(widget.data),
          Text(widget.description),
          Text(widget.sinopsis),
        ],
      ),
    );
  }
}