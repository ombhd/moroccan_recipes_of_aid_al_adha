import 'package:flutter/material.dart';

import 'pages/nav_page.dart/nav_page.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Alhanae Accessoire',
    theme: theme,
    initialRoute: NavPage.routeName,
    routes: routes,
  ));
}
