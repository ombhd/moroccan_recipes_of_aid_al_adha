import 'package:flutter/material.dart';

import '../../widgets/recipes_list.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  static const String sharedText =
      'Obtenir des accessoires pour votre smartphone dès maintenant!\n\nTélécharger l\'application mobile: ';
  static const String linkToPlayStore =
      'https://playstore.google.com/store/shop-app-demo';
  static const String linkToAppStore =
      'https://appstore.apple.com/store/shop-app-demo';

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الوصفات المغربية لعيد الأضحى')),
      body: RecipesList(
        showOnlyFavorites: false,
      ),
    );
  }
}
