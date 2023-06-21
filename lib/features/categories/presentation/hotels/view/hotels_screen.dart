import 'package:flutter/material.dart';
import 'package:pickytour/core/city_model/CityModel.dart';
import 'package:pickytour/features/categories/presentation/hotels/view/widgets/hotels_screen_body.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({Key? key, required this.cityModel, }) : super(key: key);
  final CityModel cityModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HotelsScreenBody(cityModel: cityModel,)
    );
  }
}
