import 'package:flutter/material.dart';
import '../../constants.dart';

class DesignContainer extends StatelessWidget {
  const DesignContainer({Key? key, required this.topMargin}) : super(key: key);

  final double topMargin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        color: lightColor,
      ),
    );
  }
}
