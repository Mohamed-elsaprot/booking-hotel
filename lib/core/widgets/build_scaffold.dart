import 'package:flutter/material.dart';

class BuildScaffold extends StatelessWidget {
  const BuildScaffold({Key? key, required this.scaffold}) : super(key: key);
  final Widget scaffold;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff62CDFF),
                Color(0xffB9F3FC),
                Color(0xffB9F3FC),
                Colors.white
              ]
          )
      ),
      child: scaffold
    );
  }
  //
}
