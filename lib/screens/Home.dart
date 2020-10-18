import 'package:flutter/material.dart';
import 'package:viewster/screens/Search/Search.dart';
import 'package:viewster/screens/Trending/Trending.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingShows = [];
  List trendingMovies = [];

  void getTrendingMovies() async {
    String url =
        'https://api.themoviedb.org/3/trending/movie/week?api_key=6458ca648b70d6d3d574f8e0b2ce817d';
    print(url);

    try {
      var response = await http.get(url);
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        trendingMovies = jsonResponse['results'];
      });
    } catch (e) {
      print(e);
    }
  }

  void getTrendingShows() async {
    String url =
        'https://api.themoviedb.org/3/trending/tv/week?api_key=6458ca648b70d6d3d574f8e0b2ce817d';
    print(url);

    try {
      var response = await http.get(url);
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        trendingShows = jsonResponse['results'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getTrendingShows();
    getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Viewster"),
              Container(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                      },
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "What would you\nlike to watch?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Trending Shows',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "More",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Trending(
            list: trendingShows,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Trending Movies',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "More",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Trending(
            list: trendingMovies,
          )
        ],
      ),
    );
  }
}
