import 'package:flutter/material.dart';
import '../models/joke.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Joke> _favorites = [];

  List<Joke> get favorites => _favorites;

  void addFavorite(Joke joke) {
    if (!_favorites.contains(joke)) {
      _favorites.add(joke);
      notifyListeners();
    }
  }

  void removeFavorite(Joke joke) {
    _favorites.remove(joke);
    notifyListeners();
  }

  bool isFavorite(Joke joke) {
    return _favorites.contains(joke);
  }
}