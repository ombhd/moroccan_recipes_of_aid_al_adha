import 'package:aid_adha_recipes/utils/theme.dart';
import 'package:flutter/material.dart';

import '../recipe_details_page.dart';

class ElementsColumn extends StatelessWidget {
  const ElementsColumn({
    Key? key,
    required this.elements,
    required this.fixedHorizontalPadding,
  }) : super(key: key);

  final List<String> elements;
  final double fixedHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: elements
          .map((ing) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: RecipeDetailsPage.fixedHorizontalPadding * 2.0,
                    vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        ing,
                        style: theme.textTheme.headline3!
                            .copyWith(color: const Color(0xff424242)),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(width: 15.0),
                    if (elements.length > 1)
                      Icon(
                        Icons.circle,
                        size: 10.0,
                        color: theme.primaryColorDark.withGreen(90),
                      ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
