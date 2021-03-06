import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:viewster/Loading.dart';
import 'package:viewster/provider/UserInfoProvider.dart';

class TvDetails extends StatefulWidget {
  final int id;

  TvDetails({
    this.id,
  });

  @override
  _TvDetailsState createState() => _TvDetailsState();
}

class _TvDetailsState extends State<TvDetails> {
  Map results = {};
  bool loading = true;

  fetchData() async {
    String url =
        "https://api.themoviedb.org/3/tv/${widget.id}?api_key=6458ca648b70d6d3d574f8e0b2ce817d&language=en-US&append_to_response=credits";

    try {
      var response = await http.get(url);
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        results = jsonResponse;
        loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();
    print(widget.id);
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.black12,
        actions: <Widget>[
          Consumer<UserInfoProvider>(
            builder: (context, favs, child) {
              if (favs.isShowPresent(widget.id)) {
                return IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      Provider.of<UserInfoProvider>(context, listen: false)
                          .removeShow(widget.id);
                    });
              } else {
                return IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      Provider.of<UserInfoProvider>(context, listen: false)
                          .addShow(results);
                    });
              }
            },
          ),
        ],
      ),
      body: loading
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInImage.assetNetwork(
                      placeholder: "assets/images/movie.jpg",
                      image:
                          "https://image.tmdb.org/t/p/w500${results['backdrop_path']}"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${results['original_name']} (${DateFormat('yyyy').format(DateTime.parse(results['first_air_date']))})",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          height: 35,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: results['genres'].length == 0 ? 0 : 2,
                            itemBuilder: (context, index) {
                              return Text(
                                results['genres'][index]['name'],
                                style: TextStyle(fontSize: 20),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Text(
                                " / ",
                                style: TextStyle(fontSize: 20),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 25,
                            ),
                            Text(
                              results['vote_average'].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Overview",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          results['overview'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Creator(s)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          height: 290,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: results['created_by'].length ?? 0,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                child: Column(
                                  children: <Widget>[
                                    FadeInImage.assetNetwork(
                                      width: 150,
                                      height: 180,
                                      placeholder: "assets/images/notfound.png",
                                      image:
                                          "https://image.tmdb.org/t/p/w154${results['created_by'][index]['profile_path']}",
                                      fit: BoxFit.fitWidth,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      results['created_by'][index]['name'],
                                      softWrap: true,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          "Cast(s)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          height: 330,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: results['credits']['cast'].length ?? 0,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                child: Column(
                                  children: <Widget>[
                                    FadeInImage.assetNetwork(
                                      width: 150,
                                      height: 180,
                                      placeholder: "assets/images/notfound.png",
                                      image:
                                          "https://image.tmdb.org/t/p/w154${results['credits']['cast'][index]["profile_path"]}",
                                      fit: BoxFit.fitWidth,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          results['credits']['cast'][index]
                                              ['name'],
                                          softWrap: true,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          results['credits']['cast'][index]
                                              ['character'],
                                          softWrap: true,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
