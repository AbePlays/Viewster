import 'package:flutter/material.dart';
import 'package:viewster/firebase/Functions.dart' as FirebaseFunctions;
import 'package:viewster/models/MovieModel.dart';

class FavoritesProvider extends ChangeNotifier {
  List favoriteShows = [];
  List favoriteMovies = [];

  List get favShows => favoriteShows;
  List get favMovies => favoriteMovies;

  Future<void> addMovie(Map data) async {
    MovieModel model = new MovieModel(
        id: data['id'],
        title: data['original_title'],
        imageUrl: data['poster_path'],
        language: data['original_language'],
        releaseDate: data['release_date'],
        votes: data['vote_average'].toString());

    favoriteMovies.add(model);
    notifyListeners();
    await FirebaseFunctions.addDataToFirestore(model.toJson());
  }

  addShow() {}

  removeShow() {}

  removeMovie() {}
}
