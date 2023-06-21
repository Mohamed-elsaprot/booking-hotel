import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key,required this.scaleAni}) : super(key: key);
  final Animation<double> scaleAni;
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAni,
      child: const CustomText(
        text: 'PickyTour',
        size: 48,
      ),
    );
  }
}
