import 'package:flutter/material.dart';
import '../../constants.dart';

void customSnackBar(BuildContext ctx,String text){
  ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
          backgroundColor:scaffoldColor,
          content: Row(
              children:[
                const Icon(Icons.error_outline,color: lightColor,),
                const SizedBox(width: 15,),
                Text(text.length< 50? text :'error',style: const TextStyle(color: Colors.white,),overflow: TextOverflow.ellipsis,softWrap: true,),
              ],
            ),
          )
  );
}

MaterialColor generateMaterialColor(Color color){
  final Map<int,Color> swatch={};
  for(int i=0;i<10;i++){
    late int key;
    if(i==0) {key=50;} else {key=i*100;}

    final double op= (0.1*i)+0.1;
    swatch[key]=Color.fromRGBO(color.red, color.green, color.blue, op);

  }
  return MaterialColor(color.value, swatch);
}
