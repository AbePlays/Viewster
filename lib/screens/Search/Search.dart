import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:viewster/screens/Details/MovieDetails.dart';
import 'package:viewster/screens/Details/TvDetails.dart';
import 'dart:convert' as convert;

import 'package:viewster/screens/Search/SearchCard.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String current = "movie";
  String query = "";
  List results = [];

  void search() async {
    setState(() {
      results = [];
    });
    print('$query $current');

    String url =
        'https://api.themoviedb.org/3/search/$current?api_key=6458ca648b70d6d3d574f8e0b2ce817d&language=en-US&query=$query&append_to_response=credits';
    print(url);

    try {
      var response = await http.get(url);
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        results = jsonResponse['results'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.search),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              query = val;
                            });
                          },
                          onEditingComplete: search,
                          decoration: InputDecoration(
                              hintText: "What would you like to watch?",
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Radio(
                        activeColor: Colors.black,
                        value: "movie",
                        groupValue: current,
                        onChanged: (String value) {
                          setState(() {
                            results = [];
                            current = value;
                          });
                        },
                      ),
                      Text("Movie"),
                      Radio(
                        activeColor: Colors.black,
                        value: "tv",
                        groupValue: current,
                        onChanged: (String value) {
                          setState(() {
                            results = [];
                            current = value;
                          });
                        },
                      ),
                      Text("Show"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: results.length,
                itemBuilder: (context, index) {
                  if (current == "movie") {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetails(
                              id: results[index]['id'],
                            ),
                          ),
                        );
                      },
                      child: SearchCard(
                        imageUrl: results[index]['poster_path'],
                        language: results[index]['original_language'],
                        releaseDate: results[index]['release_date'],
                        title: results[index]['original_title'],
                        votes: results[index]['vote_average'].toString(),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TvDetails(
                                    id: results[index]['id'],
                                  )),
                        );
                      },
                      child: SearchCard(
                        imageUrl: results[index]['poster_path'],
                        language: results[index]['original_language'],
                        releaseDate: results[index]['first_air_date'],
                        title: results[index]['original_name'],
                        votes: results[index]['vote_average'].toString(),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
