import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/provider/controller.dart';
import 'package:wordle/pages/home_page.dart';

import 'constants/colors.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Controller())],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorLight: lightThemeLightShade,
        primaryColorDark: lightThemeDarkShade,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme().copyWith(bodyMedium:const TextStyle(fontWeight: FontWeight.bold))
      ),
      
      home: const HomePage(),
    );
  }
}
