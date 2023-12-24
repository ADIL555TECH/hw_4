import 'package:flutter/material.dart';
import 'package:hw_4/welcome_screen.dart';
import 'package:hw_4/second_screen.dart';
import 'package:hw_4/third_screen.dart';
import 'page_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return FadePageRouteBuilder(WelcomeScreen());
          case '/secondScreen':
            return FadePageRouteBuilder(SecondScreen());
          case '/thirdScreen':
            return FadePageRouteBuilder(ThirdScreen());
          default:
            return null;
        }
      },
    );
  }
}