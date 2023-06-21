import 'package:flutter/material.dart';

class VisaPic extends StatelessWidget {
  const VisaPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/visa.png',height: size.height*.05,),
            Image.asset('assets/images/master.png',height: size.height*.05,),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
          child: SizedBox(height: size.height*.2,child: Image.asset('assets/images/card.png'),),
        ),
      ],
    );
  }
}
