import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../test_data.dart';
import '../../../doublicated_widgets/cover_item.dart';

class RecommendedHotels extends StatelessWidget {
  const RecommendedHotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .2,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      width: size.width,
      child: CarouselSlider.builder(
        itemCount: hotelsImages.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return LayoutBuilder(
            builder: (context, constrain) {
              return Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: constrain.maxHeight * .75,
                          child:
                              CoverItem(url: hotelsImages[index], function: () {})),
                      Positioned(
                        right: 10,
                        top: 5,
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              size: constrain.maxWidth * .10,
                              color: Colors.yellow,
                            ),
                            const CustomText(
                              text: '4.8',
                              size: 12,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: constrain.maxHeight * .25,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constrain.maxHeight * .05),
                      child: CustomText(
                        text: 'Blue Beach Club',
                        size: 12,
                        color: coffeeColor.withOpacity(.8),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
        options: CarouselOptions(
            viewportFraction: .35,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayCurve: Curves.linear,
            reverse: true),
      ),
    );
  }
}

