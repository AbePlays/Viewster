import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewster/provider/FavoritesProvider.dart';
import 'package:viewster/screens/Search/SearchCard.dart';

class FavoriteMovies extends StatefulWidget {
  @override
  _FavoriteMoviesState createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Favorite Movies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Consumer<FavoritesProvider>(
              builder: (context, favs, child) {
                if (favs.favMovies.length == 0) {
                  return Center(
                      child: Text(
                    "Favorites Empty",
                    style: TextStyle(fontSize: 20),
                  ));
                } else {
                  return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return SearchCard(
                          imageUrl: favs.favMovies[index]['imageUrl'],
                          language: favs.favMovies[index]['language'],
                          releaseDate: favs.favMovies[index]['releaseDate'],
                          title: favs.favMovies[index]['title'],
                          votes: favs.favMovies[index]['votes'],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: favs.favMovies.length);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
