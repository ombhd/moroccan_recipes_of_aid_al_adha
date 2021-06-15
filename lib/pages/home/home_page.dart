import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الوصفات المغربية لعيد الأضحى'),
      ),
      body: Center(
        child: Text('home'),
      ),
    );
  }
}
