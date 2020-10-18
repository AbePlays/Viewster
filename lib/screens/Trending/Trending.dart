import 'package:flutter/material.dart';
import 'package:viewster/screens/Details/MovieDetails.dart';
import 'package:viewster/screens/Details/TvDetails.dart';

class Trending extends StatefulWidget {
  final List list;
  final bool isShow;
  Trending({this.list, this.isShow});

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.isEmpty ? 0 : 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.isShow
                          ? TvDetails(id: widget.list[index]['id'])
                          : MovieDetails(id: widget.list[index]['id'])));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/notfound.png',
                    image:
                        "https://image.tmdb.org/t/p/w185${widget.list[index]['poster_path']}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
