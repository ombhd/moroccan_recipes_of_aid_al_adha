import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  List<String> _items = [];

  void toogleFavorite(String recipeId) {
    try {
      _items.firstWhere((id) => id == recipeId);
      _items.removeWhere((id) => id == recipeId);
    } on StateError {
      _items.add(recipeId);
    }
    notifyListeners();
  }

  int get numberOfItems => _items.length;

  bool isFavorite(String recipeId) {
    try {
      _items.firstWhere((id) => id == recipeId);
      return true;
    } on StateError {
      return false;
    }
  }
}
