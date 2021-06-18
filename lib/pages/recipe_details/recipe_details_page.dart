import 'package:aid_adha_recipes/models/Recipes.dart';
import 'package:aid_adha_recipes/models/favorites_model.dart';
import 'package:aid_adha_recipes/pages/recipe_details/components/heading.dart';
import 'package:aid_adha_recipes/utils/context_size.dart';
import 'package:aid_adha_recipes/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'components/elements_column.dart';

class RecipeDetailsPage extends StatelessWidget {
  static const routeName = '/recipe-details';

  static const double fixedHorizontalPadding = 12.0;

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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(recipe.imageAsset),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffadadad).withAlpha(160),
                        spreadRadius: 2.0,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ]),
              ),
              Positioned(
                right: 5.0,
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
                        color: Colors.red.withAlpha(isFavorite ? 255 : 180),
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                top: 6.0,
                child: Container(
                  margin: EdgeInsets.only(top: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.scaffoldBackgroundColor.withAlpha(160),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.primaryColorDark,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: fixedHorizontalPadding, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow[800],
                  size: 25.0,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.watch_later,
                    color: theme.primaryColorDark.withAlpha(120),
                    size: 20.0,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 3.0),
                      Text('  ${recipe.cookingDuration} min',
                          style: theme.textTheme.headline3!
                              .copyWith(color: theme.primaryColorDark)),
                    ],
                  ),
                ],
              ),
              HeadingWidget(title: 'مدة التحضير'),
            ],
          ),
          if (recipe.ingredients.length > 0) HeadingWidget(title: 'المقادير'),
          if (recipe.ingredients.length > 0)
            ElementsColumn(
                elements: recipe.ingredients,
                fixedHorizontalPadding: fixedHorizontalPadding),
          SizedBox(height: fixedHorizontalPadding),
          if (recipe.cookGuides.length > 0)
            HeadingWidget(title: 'طريقة التحضير'),
          if (recipe.cookGuides.length > 0)
            ElementsColumn(
                elements: recipe.cookGuides,
                fixedHorizontalPadding: fixedHorizontalPadding),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 30, vertical: fixedHorizontalPadding),
            padding: EdgeInsets.symmetric(vertical: fixedHorizontalPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: theme.accentColor),
            child: GestureDetector(
              onTap: () {
                Share.shareFiles(['djfj']);
                Share.share('sharing the recipe with link to the app ');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.share,
                    color: theme.primaryColorDark,
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    'شاركي الوصفة',
                    textDirection: TextDirection.rtl,
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
