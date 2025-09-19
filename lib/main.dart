import 'package:flutter/material.dart';
import 'package:untitled4/screens/home.dart';
import 'package:untitled4/splash_screen/splash_screen.dart';
import 'package:untitled4/sura_detailes/sura_details.dart';
import 'package:untitled4/core/themes/app_theme.dart';
//import 'core/excisions/excisions.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      darkTheme:AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        SplashScreen.route: (_) => SplashScreen(),
        Home.route: (_) => Home(),
        SuraDetails.route: (_) => SuraDetails(),
      },
    );
  }
}
