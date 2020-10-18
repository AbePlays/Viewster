import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  final List list;
  Trending({this.list});

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
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/notfound.png',
                  image:
                      "https://image.tmdb.org/t/p/w185${widget.list[index]['poster_path']}"),
            ),
          );
        },
      ),
    );
  }
}
