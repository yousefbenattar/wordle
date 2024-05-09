import 'package:flutter/material.dart';
import 'package:wordle/constants/anwser_stages.dart';
import 'package:wordle/data/keys_map.dart';
import 'package:wordle/models/tile_model.dart';

class Controller extends ChangeNotifier {
  bool checkLine = false , isBackOrEnter = false , gameWon = false;
  int currentTile = 0, currentrow = 0;
  List<TileModel> tilesEntered = [];
  String correctWord = "";
  setCorrectWord({required String word}) => correctWord = word;

  setKeyTapped({required String value}) {
    if (value == "ENTER") {
      if (currentTile == 5 * (currentrow + 1)) {
        checkWord();
        isBackOrEnter = true ;
      }
    } else if (value == "BACK") {
      if (currentTile > 5 * (currentrow + 1) - 5) {
        currentTile--;
        tilesEntered.removeLast();
        isBackOrEnter = true ;
      }
    } else {
      if (currentTile < 5 * (currentrow + 1)) {
        tilesEntered.add(TileModel(letter: value, answerStages: AnswerStages.notAnswered));
        currentTile++;
        isBackOrEnter = false ;
      }
    }
    notifyListeners();
  }

  checkWord() {
    List<String> guessed = [], remainingcorrect = [];
    String guessedWord = "";


    for (int i = currentrow * 5; i < (currentrow * 5) + 5; i++) {
      guessed.add(tilesEntered[i].letter);
    }
    guessedWord = guessed.join();
    remainingcorrect == correctWord.characters.toList();


    
      if (guessedWord == correctWord) {
      for (int i = currentrow * 5; i < (currentrow * 5) + 5; i++) {
        tilesEntered[i].answerStages = AnswerStages.correct;
        keysmap.update(tilesEntered[i].letter, (value) => AnswerStages.correct);
        gameWon = true ;
      }
    } else {
      for (int i = 0; i < 5; i++) {
        if (guessedWord[i] == correctWord[i]) {
          remainingcorrect.remove(guessedWord[i]);
          tilesEntered[i + (currentrow * 5)].answerStages = AnswerStages.correct;
          keysmap.update(guessedWord[i], (value) => AnswerStages.correct);
        }
      }



      for (int i = 0; i < remainingcorrect.length; i++) {
        for (int j = 0; j < 5; j++) {
          if (remainingcorrect[i] ==
              tilesEntered[j + (currentrow * 5)].letter) {
            if (tilesEntered[j + (currentrow * 5)].answerStages !=
                AnswerStages.correct) {
              tilesEntered[j + (currentrow * 5)].answerStages =
                  AnswerStages.contains;
            }

            final resultKey = keysmap.entries.where((element) =>
                element.key == tilesEntered[j + (currentrow * 5)].letter);

            if (resultKey.single.value != AnswerStages.correct) {
              keysmap.update(
                  resultKey.single.key, (value) => AnswerStages.contains);
            }
          }
        }
      }
      for (int i = currentrow * 5; i < (currentrow * 5) + 5; i++) {
        if (tilesEntered[i].answerStages == AnswerStages.notAnswered) {
          tilesEntered[i].answerStages = AnswerStages.incorrect;
          keysmap.update(
              tilesEntered[i].letter, (value) => AnswerStages.incorrect);
        }
      }
    }
    checkLine = true;
    currentrow++;
    notifyListeners();
  }
}
