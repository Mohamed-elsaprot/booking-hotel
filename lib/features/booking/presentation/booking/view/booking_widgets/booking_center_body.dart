import 'package:flutter/material.dart';
import 'package:pickytour/core/city_model/Hotels.dart';
import 'package:readmore/readmore.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/widgets/custom_text.dart';

class BookingCenterBody extends StatelessWidget {
  const BookingCenterBody({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;
  final TextStyle style=const TextStyle(color: Colors.blue,fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: hotel.name!,
                  size: size.width * .045,
                  color: coffeeColor,
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    RatingStars(
                      starsNum: hotel.rate!,
                    ),
                    Text(
                      '   (${hotel.price} reviews)',
                      style: TextStyle(color: Colors.black45, fontSize: size.width*.04),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 12),
                        height: size.width*.1,
                        width: size.width*.1,
                        child: const Image(
                          image: AssetImage(
                            'assets/images/location.png',
                          ),
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      width: size.width*.7,
                      child: CustomText(
                        text: hotel.location!,
                        size: 14,
                        color: Colors.black.withOpacity(.5),
                        textAlign: TextAlign.start,
                        shadowsList: const [BoxShadow()],

                      ),),
                  ],
                )
              ],
            ),

        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Details', size: size.width*.045,color: Colors.black.withOpacity(.7),shadowsList: const [BoxShadow()],),
              const SizedBox(height: 10,),
              ReadMoreText(
                hotel.describtion!,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                moreStyle: style,
                trimExpandedText: ' Read less',
                lessStyle: style,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                    fontSize: size.width*.035
                ),
              )

            ],
          ),

      ],
    );
  }
}

class RatingStars extends StatelessWidget {
  const RatingStars({Key? key, required this.starsNum}) : super(key: key);
  final int starsNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < starsNum; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ratingStars(),
          )
      ],
    );
  }

  Widget ratingStars() {
    return const Icon(
      Icons.star_rounded,
      color: Colors.orangeAccent,
      size: 25,
    );
  }
}

