import 'package:aid_adha_recipes/models/recipe_model.dart';
import 'package:aid_adha_recipes/pages/recipe_details/recipe_details_page.dart';

import '../models/Recipes.dart';
import '../models/favorites_model.dart';
import '../utils/context_size.dart';
import '../utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesList extends StatelessWidget {
  final showOnlyFavorites;

  const RecipesList({
    Key? key,
    required this.showOnlyFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<Recipes>(context, listen: false);
    final size = SizeContext(context);
    final List<Recipe> items =
        !showOnlyFavorites ? recipes.items : recipes.favItems;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RecipeDetailsPage.routeName, arguments: items[index].id);
                },
                onDoubleTap: () {
                  recipes.favorites?.toogleFavorite(items[index].id);
                },
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(items[index].imageAsset),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffadadad).withAlpha(160),
                              spreadRadius: 2.0,
                              blurRadius: 10.0,
                            )
                          ]),
                    ),
                    Positioned(
                      right: 10.0,
                      top: 10.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: theme.scaffoldBackgroundColor,
                        ),
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
                                Text(' ${items[index].rating}',
                                    style: theme.textTheme.headline4),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            recipes.favorites?.toogleFavorite(items[index].id);
                          },
                          icon: Selector<Favorites, bool>(
                            selector: (ctx, favs) =>
                                favs.isFavorite(items[index].id),
                            builder: (context, isFavorite, child) => Icon(
                              isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_rounded,
                              color: isFavorite
                                  ? Colors.red
                                  : const Color(0xffadadad),
                              size: 30.0,
                            ),
                          ),
                        ),
                        Text(
                          items[index].title,
                          textAlign: TextAlign.right,
                          style: theme.textTheme.headline6,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.watch_later,
                          color: theme.primaryColorDark.withAlpha(120),
                          size: 20.0,
                        ),
                        Text('  ${items[index].cookingDuration} min',
                            style: theme.textTheme.caption),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
