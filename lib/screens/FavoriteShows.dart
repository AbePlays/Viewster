import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewster/provider/UserInfoProvider.dart';
import 'package:viewster/screens/Details/TvDetails.dart';

import 'Search/SearchCard.dart';

class FavoriteShows extends StatefulWidget {
  @override
  _FavoriteShowsState createState() => _FavoriteShowsState();
}

class _FavoriteShowsState extends State<FavoriteShows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Favorite Shows",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Consumer<UserInfoProvider>(
              builder: (context, favs, child) {
                if (favs.favShows.length == 0) {
                  return Center(
                      child: Text(
                    "Favorites Empty",
                    style: TextStyle(fontSize: 20),
                  ));
                } else {
                  return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TvDetails(
                                          id: favs.favShows[index]['id'],
                                        )));
                          },
                          child: SearchCard(
                            imageUrl: favs.favShows[index]['imageUrl'],
                            language: favs.favShows[index]['language'],
                            releaseDate: favs.favShows[index]['releaseDate'],
                            title: favs.favShows[index]['title'],
                            votes: favs.favShows[index]['votes'],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: favs.favShows.length);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
