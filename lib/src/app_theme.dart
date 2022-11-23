import 'package:flutter/material.dart';

class AppTheme {
  get darkTheme => ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      secondaryHeaderColor: Colors.pink,
      primaryColor: Colors.yellow[700],

      //Used by certain widets like the Switch, FAB, etc.
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: Colors.yellow[700],
          ),

      // Define the default font family.
      fontFamily: 'Roboto',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
        subtitle1: TextStyle(fontSize: 12.0, color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          titleTextStyle: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold)));

  get lightTheme => ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      secondaryHeaderColor: Colors.pink,
      primaryColor: Colors.yellow[700],

      //Used by certain widets like the Switch, FAB, etc.
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: Colors.yellow[700],
          ),

      // Define the default font family.
      fontFamily: 'Roboto',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
        subtitle1: TextStyle(fontSize: 12.0, color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          titleTextStyle: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold)));
}
