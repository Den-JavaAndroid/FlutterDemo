import 'package:demo/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/movie_provider.dart';

import 'screens/home_screen.dart';
//example from https://www.kindacode.com/article/using-provider-for-state-management-in-flutter/#single__comments
void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: const MyApp(),
    create: (_) => MovieProvider(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Travel app',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const WelcomePage(),
    );
  }
}