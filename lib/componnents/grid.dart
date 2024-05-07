import 'package:flutter/material.dart';
import 'tile.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 36),
      physics:const NeverScrollableScrollPhysics(),
      itemCount: 30,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4),
        itemBuilder: (itemBuilder,index) {
          return Tile(index :index);
        });}}