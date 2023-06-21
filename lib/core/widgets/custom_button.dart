import 'package:flutter/material.dart';
import 'package:pickytour/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.color,
    this.textColor,
    required this.radius,
    required this.text,
    required this.onPressed,
    this.hPadding,
    required this.fontSize,
    this.fW,
  }) : super(key: key);
  final Color? color;
  final Color? textColor;
  final String text;
  final double radius;
  final double fontSize;
  final FontWeight? fW;
  final double? hPadding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color??blueColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius),),
        shadowColor: Colors.black54,
        elevation: 15,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding??22, vertical: 6),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? lightColor,
              fontSize: fontSize,
              fontFamily: family,
              fontWeight:fW?? FontWeight.w600,
              shadows: [
                BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    offset: const Offset(2, 2),
                    blurRadius: 10)
              ]),
        ),
      ),
    );
  }
}
