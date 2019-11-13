import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/detail_movie.dart';
import 'package:flutter_app/list_movie.dart';
//import 'text_and_icon_button.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
//        body: ListMovie(),
        body: MyApp(),
      ),
      routes: <String, WidgetBuilder>{
        '/movie_list': (BuildContext context) => ListMovie(),
        '/movie_detail': (BuildContext context) => DetailMovie()
      },
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<ScaffoldState>keyScaffold = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: keyScaffold,
      appBar: AppBar(
        title: Text('Latihan'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              child: Image.asset(
                'lib/asset/blue.jpg',
                fit: BoxFit.cover,
              ),
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Image.asset('lib/asset/logo.png',height: 170,),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: usernameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(hintText: 'username'),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(hintText: 'password'),
                ),
              ),
              RaisedButton(
                onPressed: () => checkUser(usernameController.text, passwordController.text),
                color: Colors.amber[300],
                child: Text('LOGIN',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ],
      ),
    );
  }

  void checkUser(String username, String password){
    if(username == 'eko.tulus@bssn.go.id' && password == '123456'){
//      print('user benar');
//      keyScaffold.currentState.showSnackBar(
//        SnackBar(
//            content: Text('Username Correct'),
//        ),
//      );
        Navigator.pushNamed(context, '/movie_list');
    } else {
//      print ('user salah');
      keyScaffold.currentState.showSnackBar(
          SnackBar(
              content: Text('Username Not Found'),
          ),
      );
    }
  }
}