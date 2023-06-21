import 'package:flutter/material.dart';
import 'package:pickytour/constants.dart';
import 'package:pickytour/core/city_model/CityModel.dart';
import 'package:pickytour/core/widgets/custom_text.dart';
import 'package:pickytour/core/widgets/design_container.dart';
import 'package:pickytour/features/categories/presentation/hotels/view/widgets/recommended_hotels.dart';
import 'hotels_list.dart';
import 'hotelse_screen_bar.dart';

class HotelsScreenBody extends StatelessWidget {
  const HotelsScreenBody({Key? key, required this.cityModel,}) : super(key: key);
  final CityModel cityModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        DesignContainer(topMargin: size.height * .11),
        HotelsScreenBar(cityModel: cityModel,),
        Container(
          margin: EdgeInsets.only(top: size.height * .13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: const EdgeInsets.only(left: 25),
                child: CustomText(
                  text: 'showing ${cityModel.hotels!.length} properties',
                  size: 18,
                  color: coffeeColor.withOpacity(.8),
                ),
              ),
              SizedBox(
                height: size.height * .6,
                child: HotelsList(cityModel: cityModel,),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 25),
                child: CustomText(text: 'recommendations', size: 18,color: coffeeColor.withOpacity(.8),),
              ),
              const RecommendedHotels()
            ],
          ),
        )
      ],
    );
  }
}

