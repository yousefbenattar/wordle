import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  int currentTile = 0,currentrow = 0;
  setKeyTapped({required String value}) {
    if (value == "ENTER")
    {
      if(currentTile==5 * (currentrow +1)){
        currentrow++;
        debugPrint('check Tile');
      }
    } else if (value == "BACK")
    {
      if (currentTile > 5 * (currentrow +1) - 5) {
        currentTile--;
      }
    } else {
      if (currentTile < 5 * (currentrow +1)) {
        currentTile++;
      }
    }
      debugPrint('$currentTile');
      debugPrint('$currentrow');
  }
}
