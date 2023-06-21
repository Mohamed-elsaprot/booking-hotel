import 'package:flutter/material.dart';
import 'package:pickytour/core/widgets/custom_text.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title, this.rating}) : super(key: key);
  final String title;
  final int? rating;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(text: title, size: size.width*.04),
          if(rating!=null)
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      size: size.width* .04,
                      color: Colors.yellow,
                    ),
                    CustomText(
                      text: '$rating'?? '0',
                      size: size.width*.03,
                      color: Colors.white,
                    )
                  ],
                )
          else Row(),
        ],
      );
  }
}
