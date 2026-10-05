import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/view/home_screen.dart';

import 'features/view/details_screen.dart';

void main() {
  AppApi.getNews();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes:{
        AppRoutes.home: (context)=> const HomeScreen(),
        AppRoutes.details: (context)=> const DetailsScreen(),
      }
    );
  }
}