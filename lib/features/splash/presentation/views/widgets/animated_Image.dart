import 'package:flutter/material.dart';

class AnimatedSplashImage extends StatelessWidget {
  const AnimatedSplashImage({Key? key, required this.height, required this.rotateAni,}) : super(key: key);
  final double height;
  final Animation<double> rotateAni;


  @override
  Widget build(BuildContext context) {
    return  RotationTransition(
            turns: rotateAni,
            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(-5, 5),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/hotel02.jpg'),
                      fit: BoxFit.fill)),
              height: height,
            ),

    );

  }
}


