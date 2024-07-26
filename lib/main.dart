

import 'package:departure_gita/splash_screen.dart';
import 'package:departure_gita/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';
import 'home_page.dart';
import 'home_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: Provider.of<ThemeProvider>(context).theme,
          initialRoute: "/",
          routes: {
            "/": (context) => SplashScreen(),
            "home_page": (context) => HomePage(),
            "detail_page": (context) => DetailPage(),
          },
        );
      },
    );
  }
}
