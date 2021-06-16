import 'package:aid_adha_recipes/models/Recipes.dart';
import 'package:aid_adha_recipes/models/favorites_model.dart';
import 'package:aid_adha_recipes/utils/context_size.dart';
import 'package:aid_adha_recipes/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeDetailsPage extends StatelessWidget {
  static const routeName = '/recipe-details';

  const RecipeDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final recipes = Provider.of<Recipes>(context);
    final recipe = recipes.getRecipeByID(id);
    final size = SizeContext(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(recipe.imageAsset),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffadadad).withAlpha(160),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                      )
                    ]),
              ),
              Positioned(
                right: 6.0,
                top: 6.0,
                child: Container(
                  margin: EdgeInsets.only(top: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.scaffoldBackgroundColor.withAlpha(160),
                  ),
                  child: IconButton(
                    onPressed: () {
                      recipes.favorites?.toogleFavorite(recipe.id);
                    },
                    icon: Selector<Favorites, bool>(
                      selector: (ctx, favs) => favs.isFavorite(recipe.id),
                      builder: (context, isFavorite, child) => Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: Colors.red.withAlpha(isFavorite ? 255 : 160),
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow[800],
                  size: 20.0,
                ),
                Column(
                  children: [
                    SizedBox(height: 3.0),
                    Text(' ${recipe.rating}', style: theme.textTheme.headline4),
                  ],
                ),
                Expanded(
                  child: Text(
                    recipe.title,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
