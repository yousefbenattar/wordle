import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/themes/themes_prefernses.dart';

import '../providers/theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Settings'),
        actions: [IconButton(onPressed: () {
          Navigator.maybePop(context);
        }, icon:const Icon(Icons.clear))],
      ),
      body: Column(children: [
        Consumer<ThemeProvider>(
          builder:(_,notefier,___) {
            bool isSwitched = false ;
            if(isSwitched = notefier.isDark ){
            }
            return SwitchListTile(value: isSwitched,onChanged: (v){
            ThemePreferenses.saveTheme(isDark: isSwitched);
            isSwitched = v ;
            Provider.of<ThemeProvider>(context,listen: false).setTheme(turnOn: v);
            debugPrint('value $v');
          },);
          },
        )
      ],),
    );
  }
}
