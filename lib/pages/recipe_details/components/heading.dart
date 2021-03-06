import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import '../recipe_details_page.dart';

class HeadingWidget extends StatelessWidget {
  final String title;

  const HeadingWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: RecipeDetailsPage.fixedHorizontalPadding,
          left: RecipeDetailsPage.fixedHorizontalPadding,
          bottom: 4.0),
      child: Text(
        title + ' :',
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style:
            theme.textTheme.headline4!.copyWith(color: theme.primaryColorDark),
      ),
    );
  }
}
