import 'package:flutter/material.dart';

class Recipe extends ChangeNotifier {
  final String id;
  final String imageAsset;
  final String title;
  final List<String> ingredients;
  final List<String> cookGuides;
  final int cookingDuration;
  double rating;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.imageAsset,
    required this.title,
    required this.ingredients,
    required this.cookGuides,
    this.cookingDuration = 30,
    this.rating = 5.0,
    this.isFavorite = false,
  });

  void toogleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
