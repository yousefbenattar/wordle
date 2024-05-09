import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/themes/themes_prefernses.dart';
import 'package:wordle/pages/home_page.dart';
import 'package:wordle/providers/controller.dart';
import 'package:wordle/providers/theme_provider.dart';
import 'constants/themes/themes.dart';

void main() {
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
      ChangeNotifierProvider(create: (_) => ThemeProvider())
    ],
    child: const MainApp()));
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: ThemePreferenses.getTheme(),
      builder:(context,snapshot) {
        if(snapshot.hasData){
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Provider.of<ThemeProvider>(context , listen: false).setTheme(turnOn: snapshot.data as bool);
          });
        }
        return Consumer<ThemeProvider>(
        builder : (_,notifier,__) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:notifier.isDark ? darkTheme : lightTheme,
          home: const HomePage(),
        ),
      );
      },
    );
  }
}
