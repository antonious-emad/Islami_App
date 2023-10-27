import 'package:flutter/material.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';

abstract class AppTheme{
  static Color primaryColor = const Color(0xFFB7935F);
  static Color OnprimaryColor =const  Color(0xFF79643D);
  static Color primaryColorDark = const Color(0xFF12182A);
  static Color BlackColor =const  Color(0xFF242424);
  static Color WhiteColor =const Color(0xFFFFFFFF);
  static Color YellowColor =const Color(0xFFFACC1D);

  static const TextStyle appBarTextStyle = TextStyle(fontWeight: FontWeight.bold,
   fontSize: 30, color: AppColors.accent);
  static const TextStyle suraNameTextStyle = TextStyle(fontWeight: FontWeight.w600,
      fontSize: 25, color: AppColors.accent);
  static const TextStyle settingsTitleTextStyle = TextStyle(fontWeight: FontWeight.bold,
      fontSize: 25, color: AppColors.accent);
  static const TextStyle settingsOptionTextStyle = TextStyle(fontWeight: FontWeight.normal,
      fontSize: 20, color: AppColors.accent);

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primiary,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color:BlackColor),
      // color: Colors.transparent,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: appBarTextStyle,
    ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 30,
          color: BlackColor,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 25,
          color: BlackColor,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 25,
          color: WhiteColor,
          fontWeight: FontWeight.w400,),
        titleMedium: TextStyle(
          fontSize: 25,
          color: BlackColor,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: BlackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF242424),
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 32)
    ),
    scaffoldBackgroundColor: AppColors.transparent,
    // textTheme: const TextTheme(
    //   bodySmall: suraNameTextStyle
    // )

  );
  static ThemeData darkTheme =  ThemeData(
      primaryColor: AppColors.primiaryDark,
      appBarTheme: AppBarTheme(
          // color: Colors.transparent,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: appBarTextStyle.copyWith(color: AppColors.white),
          iconTheme: IconThemeData(color: WhiteColor)
      ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        color: WhiteColor,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 25,
        color: YellowColor,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        color: YellowColor,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: YellowColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    scaffoldBackgroundColor: AppColors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 32),
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: Colors.white,
      ),
      // textTheme: TextTheme(
      //     bodySmall: suraNameTextStyle.copyWith(color: Colors.white),
      // )
  );
}