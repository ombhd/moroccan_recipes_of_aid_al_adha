import 'package:flutter/material.dart';

final String favoritesTable = "favorites";

class FavoritesFields {
  static final String id = "_id";
  static final String idsStringList = "idsStringList";
}

class Favorites extends ChangeNotifier {
  List<String> _items = [];

  static const String _delimiter = ',';

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

  String getFavoritesString() {
    return _items.join(_delimiter);
  }

  List<String> decodeIdsStringToList(String ids) {
    return ids.split(_delimiter);
  }

  Map<String, Object?> toJson() {
    return {
      FavoritesFields.id: _items.length,
      FavoritesFields.idsStringList: this.getFavoritesString(),
    };
  }


}
