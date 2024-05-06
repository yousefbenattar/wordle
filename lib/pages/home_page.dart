import 'package:flutter/material.dart';
import '../componnents/grid.dart';
import '../componnents/keyboardrow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Wordle'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(flex: 8, child: Grid()),
          Expanded(flex: 4,child: Container(
            
            color: Colors.red,
            child:const Column(
              children: [
                 KeyBoardRow(min: 1, max: 10,),
                 KeyBoardRow(min: 11, max: 19,),
                 KeyBoardRow(min: 20, max: 29,),
              ],
            ),
          )),
        ],
      ),
    );
  }
}


