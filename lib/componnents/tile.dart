import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/anwser_stages.dart';
import 'package:wordle/provider/controller.dart';

import '../constants/colors.dart';

class Tile extends StatefulWidget {
  const Tile({
    super.key, required this.index,
  });
  final int index ;
  @override
  State<Tile> createState() => _TileState();}
class _TileState extends State<Tile> {
  Color _backgroundColor = Colors.transparent , _borderColor = Colors.transparent ;
  late AnswerStages _answerStages;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _borderColor = Theme.of(context).primaryColorLight ;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_,notifier,__) {
        String text = '';
        Color fontColor = Colors.white;
        if (widget.index < notifier.tilesEntered.length){
          text = notifier.tilesEntered[widget.index].letter;
          _answerStages = notifier.tilesEntered[widget.index].answerStages;
          if (_answerStages == AnswerStages.correct){
            _borderColor = Colors.transparent;
            _backgroundColor = correctGreen;
          }
          else if (_answerStages == AnswerStages.contains){
            _borderColor = Colors.transparent;
            _backgroundColor = containsYellow;
          }
          else if (_answerStages == AnswerStages.incorrect) {
            _borderColor = Colors.transparent;
             _backgroundColor = Theme.of(context).primaryColorDark;
          } else {
          fontColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.blueGrey;
          }
          return Container(
            decoration: BoxDecoration(
            color: _backgroundColor,
            border: Border.all(color: _borderColor)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(text,style: const TextStyle().copyWith(
                  color: fontColor
                ),)),
            ));
        }
       
        return Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            border: Border.all(color: _borderColor)
            ),
        );
       
      },
    );
  }
}

