import 'package:flutter/material.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/widgets/custom_text.dart';

class GetInspiredText extends StatelessWidget {
  const GetInspiredText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * .285),
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Get Inspired!',
            size: size.width * .052,
            color: coffeeColor.withOpacity(.8),
          ),
          SizedBox(
            width: size.width * .6,
            child: Text(
              'Discover popular places for unforgettable adventures.',
              style: TextStyle(
                  shadows: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      offset: Offset(3, 3),
                    )
                  ],
                  fontSize: 15,
                  color: coffeeColor.withOpacity(.7),
                  fontFamily: family,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
