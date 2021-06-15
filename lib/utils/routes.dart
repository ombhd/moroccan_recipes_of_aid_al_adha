import '../pages/nav_page.dart/nav_page.dart';

import '../pages/favorites/favorites_page.dart';
import '../pages/home/home_page.dart';
import '../pages/search/search_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  NavPage.routeName: (ctx) => NavPage(),
  HomePage.routeName: (ctx) => HomePage(),
  FavoritesPage.routeName: (ctx) => FavoritesPage(),
  SearchPage.routeName: (ctx) => SearchPage(),

};