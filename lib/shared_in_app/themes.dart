import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,

    ),

  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.black54,fontSize: 22,),
    headlineMedium: TextStyle(color: Colors.black54,fontSize: 16,),
    headlineSmall: TextStyle(color: Colors.black54,fontSize: 14,),

  ),
);
ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white,),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,

    ),



  ),
   textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.white,fontSize: 22,),
    headlineMedium: TextStyle(color: Colors.white,fontSize: 16,),
    headlineSmall: TextStyle(color: Colors.white,fontSize: 14,),

  ),
);
