import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
    // fontFamily: 'Janna LT',
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true,
      titleTextStyle: AppStyles.bold20Primary,
      backgroundColor: AppColors.greyBg,
    ),
    // textTheme: TextTheme(
    //  bodyLarge: GoogleFonts.elMessiri(
    //   color:AppColors.greyBg,
    //   fontWeight: FontWeight.bold
    //  )
    // )
  );
}
