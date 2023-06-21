import 'package:flutter/material.dart';
import 'package:pickytour/constants.dart';

class BookingAction extends StatelessWidget {
  const BookingAction({
    Key? key,
    this.radius,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final text;
  final BorderRadius? radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        splashColor: blueColor,
        mini: true,
        heroTag: DateTime.now(),
        child: Text(
          text,
          style: TextStyle(
              color: lightColor,
              fontSize: size.width * .04,
              fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
