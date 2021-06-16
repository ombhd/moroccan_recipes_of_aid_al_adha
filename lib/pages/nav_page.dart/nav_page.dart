import '../../utils/context_size.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../favorites/favorites_page.dart';
import '../home/home_page.dart';
import '../search/search_page.dart';
import '../../utils/theme.dart';

class NavPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    SearchPage(),
    FavoritesPage(),
    HomePage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  PageController _controller = PageController(initialPage: 2);

  void _onTabChanged(int index) {
    _controller.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeContext(context);
    return SafeArea(
      bottom: false,
      // scaffold
      child: Scaffold(
        extendBody: true,
        body: PageView(
          children: _screens,
          onPageChanged: _onPageChanged,
          controller: _controller,
        ),

        // bottom navigation bar
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              right: size.width * 12,
              left: size.width * 12,
              bottom: size.height * 1.0),
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.5,
            horizontal: size.height * 0.6,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffadadad).withAlpha(200),
                  spreadRadius: 0.02,
                  blurRadius: 6.0,
                )
              ]),
          width: size.width * 80,
          height: 44,
          child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: _onTabChanged,
              hoverColor: const Color(0xffffffff),
              haptic: true,
              tabBorderRadius: 15,
              color: const Color(0xff000000).withAlpha(120),
              tabBorder: Border.all(
                width: 0.0,
                color: const Color(0xff000000).withAlpha(0),
              ),
              tabActiveBorder:
                  Border.all(color: const Color(0xff000000).withAlpha(0)),
              textStyle: theme.textTheme.caption,
              curve: Curves.linear,
              duration: Duration(milliseconds: 300),
              gap: 6.0,
              iconSize: 26.0,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 4.0,
                vertical: 5.0,
              ),
              tabs: [
                GButton(
                  icon: Icons.search,
                  text: 'بحث',
                  iconActiveColor: Colors.blue,
                  backgroundColor: Colors.blue.withAlpha(40),
                ),
                GButton(
                    icon: Icons.favorite,
                    text: 'المفضلة',
                    iconActiveColor: Colors.red,
                    backgroundColor: Colors.red.withAlpha(40)),
                GButton(
                  icon: Icons.home,
                  text: 'الرئيسية',
                  iconActiveColor: theme.primaryColor,
                  backgroundColor: theme.primaryColor.withAlpha(40),
                ),
              ]),
        ),
      ),
      // ),
      // ),
    );
  }
}
