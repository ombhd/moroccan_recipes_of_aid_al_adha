import 'package:flutter/material.dart';

import '../data/favorites_database.dart';

final String favoritesTable = "favorites";

class FavoritesFields {
  static final String id = "_id";
  static final String favsId = "favsId";
  static final String idsStringList = "idsStringList";
}

class Favorites extends ChangeNotifier {
  static const int _favoritesSQLID = 1337;
  List<String> _items = [];

  static const String _delimiter = ',';

  Favorites(List<String> items) {
    _items = items;
  }

  static int getID() => _favoritesSQLID;

  void toogleFavorite(String recipeId) {
    try {
      _items.firstWhere((id) => id == recipeId);
      _items.removeWhere((id) => id == recipeId);
      FavoritesDatabase.instance.updateDB(this);
    } on StateError {
      _items.add(recipeId);
      if (_items.length == 1)
        FavoritesDatabase.instance.create(this);
      else
        FavoritesDatabase.instance.updateDB(this);
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
      FavoritesFields.favsId: _favoritesSQLID,
      FavoritesFields.idsStringList: this.getFavoritesString(),
    };
  }

  static Favorites fromJSON(Map<String, Object?> json) {
    final ids = json[FavoritesFields.idsStringList] as String;
    return Favorites(ids.split(_delimiter));
  }
}
