import 'package:flutter/material.dart';

import '../../widgets/recipes_list.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الوصفات المغربية لعيد الأضحى'),
      ),
      body: RecipesList(
        showOnlyFavorites: false,
      ),
    );
  }
}
