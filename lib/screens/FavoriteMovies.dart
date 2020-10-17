import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewster/provider/FavoritesProvider.dart';

class FavoriteMovies extends StatefulWidget {
  @override
  _FavoriteMoviesState createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer<FavoritesProvider>(
      builder: (context, favs, child) {
        return Text("${favs.favMovies.length}");
      },
    ));
  }
}
