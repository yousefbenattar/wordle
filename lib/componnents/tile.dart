import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/anwser_stages.dart';
import 'package:wordle/providers/controller.dart';
import '../constants/colors.dart';

class Tile extends StatefulWidget {
  const Tile({
    super.key, required this.index,
  });
  final int index ;
  @override
  State<Tile> createState() => _TileState();}
class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController ;
  Color _backgroundColor = Colors.transparent , _borderColor = Colors.transparent ;
  late AnswerStages _answerStages;
  bool animate = false ;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _borderColor = Theme.of(context).primaryColorLight ;
    });
    _animationController = AnimationController(
      vsync: this ,
      duration:const Duration(milliseconds: 3000 ));
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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

          if(notifier.checkLine){
            final delay = widget.index - (notifier.currentrow -1) * 5;
            Future.delayed(Duration(milliseconds: 300 * delay),(){
              _animationController.forward();
              notifier.checkLine = false;
            });
          
          if (_answerStages == AnswerStages.correct){
            _backgroundColor = correctGreen;
          }
          else if (_answerStages == AnswerStages.contains){
            _backgroundColor = containsYellow;
          }
          else if (_answerStages == AnswerStages.incorrect) {
             _backgroundColor = Theme.of(context).primaryColorDark;
          } else {
          fontColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
          _backgroundColor = Colors.transparent;
          }
          }
          
          return AnimatedBuilder(
          animation: _animationController,
          builder:(_,child) {
            double flip = 0 ;
            if(_animationController.value > 0.5 ){
              flip = pi ;
            }
            return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
            ..setEntry(3, 2, 0.003)
               ..rotateX(_animationController.value * pi)
                  ..rotateX(flip),
            child: Container(
                decoration: BoxDecoration(
                color: flip > 0 ? _backgroundColor : Colors.transparent ,
                border: Border.all(
                  color: flip > 0 ? Colors.transparent : _borderColor, 
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: flip > 0 ?  Text(text,style:const TextStyle().copyWith(color: fontColor),) :
                    Text(text)
                    ),
                )),
            );}
          );
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

