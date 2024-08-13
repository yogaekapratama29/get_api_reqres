import 'package:flutter/material.dart';
import 'package:rest_api/pages/home_page_statefull.dart';
import 'package:rest_api/pages/homepage_stateless.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomepageStateless(),
    );
  }
}

