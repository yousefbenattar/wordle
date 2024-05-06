import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller.dart';
import '../data/keys_map.dart';

class KeyBoardRow extends StatelessWidget {
  const KeyBoardRow({
    super.key,required this.min,required this.max
  });
  final int min , max;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int index = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keysmap.entries.map((e){
      index++;
      if(index >= min && index <= max){
       return Padding(padding: EdgeInsets.all(size.width*0.006),
         child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
           child: SizedBox(
            width:e.key == "ENTER" || e.key == "BACK" ? size.width*0.13 : size.width*0.085,
            height: size.width*0.13,
            child: Material(
              child: InkWell(
                onTap: (){
                  Provider.of<Controller>(context,listen: false).setKeyTapped(value: e.key);
                },
                child: Center(child: Text(e.key))),
            )),
         ),
       );
      } else {
        return const SizedBox();
      }
      }).toList()
      );
  }
}
