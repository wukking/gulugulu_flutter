import 'package:flutter/material.dart';
import 'package:gulugulu_flutter/animation/FadeAnimationPage.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/fadePage': (context) => const FadeAnimationPage(title: 'fade动画')
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const FadeAnimationPage(title: 'Flutter Demo Home Page'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
