import 'package:aid_adha_recipes/widgets/recipes_list.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favs';

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الوصفات المفضلة'),
      ),
      body: RecipesList(
        showOnlyFavorites: true,
      ),
    );
  }
}
