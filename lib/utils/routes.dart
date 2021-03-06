import 'package:flutter/material.dart';

import '../pages/favorites/favorites_page.dart';
import '../pages/home/home_page.dart';
import '../pages/nav_page.dart/nav_page.dart';
import '../pages/recipe_details/recipe_details_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  NavPage.routeName: (ctx) => NavPage(),
  HomePage.routeName: (ctx) => HomePage(),
  FavoritesPage.routeName: (ctx) => FavoritesPage(),
  RecipeDetailsPage.routeName: (ctx) => RecipeDetailsPage(),
};
