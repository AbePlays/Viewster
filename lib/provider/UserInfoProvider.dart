import 'package:flutter/material.dart';
import 'package:viewster/firebase/Functions.dart' as FirebaseFunctions;
import 'package:viewster/models/MovieModel.dart';
import 'package:viewster/models/ShowModel.dart';

class UserInfoProvider extends ChangeNotifier {
  String userName = "";
  String userEmail = "";
  List favoriteShows = [];
  List favoriteMovies = [];

  List get favShows => favoriteShows;
  List get favMovies => favoriteMovies;

  void initFavs(List movies, List shows, String name, String email) {
    favoriteShows = shows;
    favoriteMovies = movies;
    userName = name;
    userEmail = email;
  }

  void addMovie(Map data) async {
    MovieModel model = new MovieModel(
        id: data['id'],
        title: data['original_title'],
        imageUrl: data['poster_path'],
        language: data['original_language'],
        releaseDate: data['release_date'],
        votes: data['vote_average'].toString());

    favoriteMovies.add(model.toJson());
    notifyListeners();
    FirebaseFunctions.updateFirestore(favoriteMovies, favoriteShows);
  }

  void addShow(Map data) {
    ShowModel model = new ShowModel(
        id: data['id'],
        title: data['original_name'],
        imageUrl: data['poster_path'],
        language: data['original_language'],
        releaseDate: data['first_air_date'],
        votes: data['vote_average'].toString());

    favoriteShows.add(model.toJson());
    notifyListeners();
    FirebaseFunctions.updateFirestore(favoriteMovies, favoriteShows);
  }

  void removeShow(int id) {
    favoriteShows.removeWhere((show) => show['id'] == id);
    notifyListeners();
    FirebaseFunctions.updateFirestore(favoriteMovies, favoriteShows);
  }

  void removeMovie(int id) {
    favoriteMovies.removeWhere((movie) => movie['id'] == id);
    notifyListeners();
    FirebaseFunctions.updateFirestore(favoriteMovies, favoriteShows);
  }

  bool isMoviePresent(int id) {
    return favMovies.where((movie) => movie['id'] == id).length != 0;
  }

  bool isShowPresent(int id) {
    return favShows.where((show) => show['id'] == id).length != 0;
  }
}
