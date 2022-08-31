import 'package:api/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routName,
      debugShowCheckedModeBanner: false,
    );
  }
}
