import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/provider/controller.dart';
import '../componnents/grid.dart';
import '../componnents/keyboardrow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();}

class _HomePageState extends State<HomePage> {
  late String _word ;
  @override
  void initState(){
  final r = Random().nextInt(words.length);
  _word = words[r];
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  Provider.of<Controller>(context,listen: false).setCorrectWord(word:_word);
  });
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Wordle'),
        centerTitle: true,
      ),
      body:const Column(
        children: [
          Divider(thickness: 1,color: Colors.black,height: 1,),
          Expanded(flex: 8, child: Grid()),
          Expanded(flex: 4,child:  Column(
            children: [
               KeyBoardRow(min: 1, max: 10,),
               KeyBoardRow(min: 11, max: 19,),
               KeyBoardRow(min: 20, max: 29,),
            ],
          )),
        ],
      ),
    );
  }
}


