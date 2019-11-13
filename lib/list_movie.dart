import 'package:flutter/material.dart';
import 'package:flutter_app/detail_movie.dart';

class ListMovie extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListMovieState();
  }
}

class ListMovieState extends State<ListMovie>{
  List<String> data =[
    'Movie1',
    'Movie2',
    'Movie3',
    'Movie4'
  ];

  List<String> description =[
    'Deskripsi Movie1',
    'Deskripsi Movie2',
    'Deskripsi Movie3',
    'Deskripsi Movie4'
  ];

  List<String> sinopsis =[
    'Detail Movie1',
    'Detail Movie2',
    'Detail Movie3',
    'Detail Movie4'
  ];

  List<String> photoMovie =[
    'https://upload.wikimedia.org/wikipedia/en/thumb/6/6f/War_official_poster.jpg/220px-War_official_poster.jpg',
    'https://id.bookmyshow.com/blog-hiburan/wp-content/uploads/2019/05/The-Forest-of-Hands-and-Teeth-Movie.jpg',
    'https://cdn.qupas.id/qupas/image/upload/w_720/discoveries/efe2e9e5ea96eaf390dddc5a9df67c16_tc4qvi',
    'https://cdn-cas.orami.co.id/parenting/images/film_holly-1.width-800.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
//        centerTitle: true,
        title: Text('List Movie'),
      ),
      body: GridView.builder(
          gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
            return GridTile(
                child: GestureDetector(
                  child: Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image.network(
                              photoMovie[index],
                              height: 150,
                              fit: BoxFit.fill,
                            ),
                            width: double.infinity,
                          ),
                          Text(data[index]),
                          Text(description[index])
                        ],
                      )
                  ),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context){
                        return DetailMovie(
                          data: data[index],
                          description: description[index],
                          photoMovie: photoMovie[index],
                          sinopsis: sinopsis[index],
                        );
                  })
                  ),
                ),
            );
          },
        itemCount: data.length,
      ),
    );
  }
}