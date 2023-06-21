import 'package:flutter/material.dart';
import 'package:pickytour/constants.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, required this.size, this.color, this.fW=FontWeight.bold, this.shadowsList, this.textAlign, this.maxLines}) : super(key: key);
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fW;
  final List<Shadow>? shadowsList;
  final TextAlign? textAlign;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textAlign?? TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color?? lightColor,
        fontWeight: fW?? FontWeight.w600,
        fontFamily: 'Poppins',
        shadows: shadowsList?? [
          const BoxShadow(
            color: Colors.black38,
            blurRadius: 20,
            offset: Offset(3,3),
          )
        ],
      ),

    );
  }
}
