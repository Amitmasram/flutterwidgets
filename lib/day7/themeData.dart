import 'package:flutter/material.dart';

class MyThemedApp extends StatelessWidget {
  const MyThemedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define the theme for the entire app
      theme: ThemeData(
        // The primary color of the app, used in various UI elements
        primaryColor: Colors.blue,

        // The accent color, used for buttons, sliders, etc.
        // accentColor: Colors.green,

        // The color for the background of the Scaffold
        scaffoldBackgroundColor: Colors.white,

        // The color of the primary text in the app
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
          ),
        ),

        // The color of the text in secondary UI elements, like AppBar titles
        appBarTheme: AppBarTheme(
          toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
            ),
          ).bodyText2,
          titleTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
            ),
          ).headline6,
        ),

        // The default font family for the entire app
        fontFamily: 'Roboto',

        // Typography settings for the app
        textTheme: TextTheme(
          // Headline text style
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

          // Subtitle text style
          subtitle1: TextStyle(fontSize: 16, color: Colors.grey),

          // Default text style for regular text
          bodyText1: TextStyle(fontSize: 14, color: Colors.black),

          // Default text style for caption text
          caption: TextStyle(fontSize: 12, color: Colors.grey),
        ),

        // Define the default button theme
        buttonTheme: ButtonThemeData(
          // Button text color
          textTheme: ButtonTextTheme.primary,

          // Button color
          buttonColor: Colors.blue,

          // Button padding
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

          // Button shape
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
      home: MyThemedHomePage(),
    );
  }
}

class MyThemedHomePage extends StatelessWidget {
  const MyThemedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themed App Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Primary Color: ${Theme.of(context).primaryColor}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Accent Color: ${Theme.of(context)}',
              style: Theme.of(context).textTheme.headline1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Themed Button'),
            ),
          ],
        ),
      ),
    );
  }
}
