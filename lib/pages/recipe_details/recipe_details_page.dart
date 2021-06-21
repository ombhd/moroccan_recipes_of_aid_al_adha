import 'dart:io';

import 'package:chehiwat_al_aid/utils/ads_ids.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/recipes.dart';
import '../../models/favorites_model.dart';
import '../../utils/context_size.dart';
import '../../utils/theme.dart';
import 'components/elements_column.dart';
import 'components/heading.dart';

class RecipeDetailsPage extends StatefulWidget {
  static const routeName = '/recipe-details';

  static const double fixedHorizontalPadding = 12.0;

  static const defaultSharedDetails =
      ': تجدين تفاصيل هذه الوصفة في تطبيق الوصفات المغربية لعيد الأضحى بما فيها المقادير و طريقة التحضير.';
  static const defaultSharedText1 =
      'يمكنك تحميل التطبيق من بلاي ستور عبر الرابط التالي:';
  static const String linkToPlayStore =
      'https://play.google.com/store/apps/details?id=com.ombhd.chehiwat_al_aid';
  static const String textToShare = defaultSharedDetails +
      '\n\n' +
      defaultSharedText1 +
      '\n\n' +
      linkToPlayStore +
      '\n';

  const RecipeDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  bool isLoaded = false;

  late BannerAd _ad;

  @override
  void initState() {
    super.initState();
    _ad = BannerAd(
      adUnitId: bannerId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(onAdLoaded: (_) {
        setState(() {
          isLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        print('ad failed to load, Error: $error');
      }),
    );
    _ad.load();
  }

  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  Widget buildBannerAd() {
    if (isLoaded)
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15.0),
        width: _ad.size.width.toDouble(),
        height: _ad.size.height.toDouble(),
        alignment: Alignment.center,
        child: AdWidget(ad: _ad),
      );
    return Center(child: CircularProgressIndicator(color: theme.primaryColor));
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final recipes = Provider.of<Recipes>(context);
    final recipe = recipes.getRecipeByID(id);
    final size = SizeContext(context);

    return Scaffold(
      body: ListView(
        children: [
          // recipe image with like button and back button
          Stack(
            children: [
              // image container
              Container(
                height: size.height * 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: theme.accentColor,
                  image: DecorationImage(
                    image: AssetImage(recipe.imageAsset),
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
                  ],
                  color: const Color(0xffffffff),
                ),
              ),

              // like button
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

              // back button
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

          // title and rating row
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: RecipeDetailsPage.fixedHorizontalPadding,
                vertical: 12.0),
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

          // cooking duration row
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

          // ingredients column
          if (recipe.ingredients.length > 0) HeadingWidget(title: 'المقادير'),
          if (recipe.ingredients.length > 0)
            ElementsColumn(
                elements: recipe.ingredients,
                fixedHorizontalPadding:
                    RecipeDetailsPage.fixedHorizontalPadding),
          SizedBox(height: RecipeDetailsPage.fixedHorizontalPadding),

          // banner ad
          buildBannerAd(),

          // cooking guides column
          if (recipe.cookGuides.length > 0)
            HeadingWidget(title: 'طريقة التحضير'),
          if (recipe.cookGuides.length > 0)
            ElementsColumn(
                elements: recipe.cookGuides,
                fixedHorizontalPadding:
                    RecipeDetailsPage.fixedHorizontalPadding),

          // share recipe button
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 30,
                vertical: RecipeDetailsPage.fixedHorizontalPadding),
            padding: EdgeInsets.symmetric(
                vertical: RecipeDetailsPage.fixedHorizontalPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: theme.accentColor),
            child: GestureDetector(
              onTap: () async {
                final String finalSharedText =
                    recipe.title + RecipeDetailsPage.textToShare;

                // saving recipe image to temp directory
                File f = await getImageFileFromAssets(
                    recipe.imageAsset.split('/').last);
                // share image with some text (recipe title + app link in playstore)
                Share.shareFiles([f.path], text: finalSharedText);
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
                    'شارك الوصفة',
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

Future<File> getImageFileFromAssets(String path) async {
  final fullPath = '${(await getTemporaryDirectory()).path}/$path';
  File file = File(fullPath);
  if (await file.exists()) return file;

  final byteData = await rootBundle.load('assets/images/$path');

  file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  return file;
}


// String get sharedText => 