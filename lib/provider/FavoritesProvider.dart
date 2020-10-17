import 'package:flutter/material.dart';
import 'package:viewster/firebase/Functions.dart' as FirebaseFunctions;
import 'package:viewster/models/MovieModel.dart';
import 'package:viewster/models/ShowModel.dart';

class FavoritesProvider extends ChangeNotifier {
  List favoriteShows = [];
  List favoriteMovies = [];

  List get favShows => favoriteShows;
  List get favMovies => favoriteMovies;

  void initFavs(List movies, List shows) {
    favoriteShows = shows;
    favoriteMovies = movies;
  }

  Future<void> addMovie(Map data) async {
    MovieModel model = new MovieModel(
        id: data['id'],
        title: data['original_title'],
        imageUrl: data['poster_path'],
        language: data['original_language'],
        releaseDate: data['release_date'],
        votes: data['vote_average'].toString());

    favoriteMovies.add(model.toJson());
    notifyListeners();
    await FirebaseFunctions.updateFirestore(favoriteMovies, favoriteShows);
  }

  Future<void> addShow(Map data) async {
    ShowModel model = new ShowModel(
        id: data['id'],
        title: data['original_name'],
        imageUrl: data['poster_path'],
        language: data['original_language'],
        releaseDate: data['first_air_date'],
        votes: data['vote_average'].toString());

    favoriteShows.add(model.toJson());
    notifyListeners();
    await FirebaseFunctions.updateFirestore(favoriteMovies, favoriteShows);
  }

  removeShow() {}

  removeMovie() {}
}
