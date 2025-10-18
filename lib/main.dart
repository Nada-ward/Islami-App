import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/on_boarding/on_boarding_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/details1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran/details2/sura_details_screen2.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingScreen,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.onBoardingScreen: (context) => OnBoardingScreen(),
        AppRoutes.homeScreen: (context) => HomeScreen(),
        AppRoutes.suraDetailsOne: (context) => SuraDetails1(),
        AppRoutes.suraDetailsTwo: (context) => SuraDetailsScreen2(),
      },
    );
  }
}
