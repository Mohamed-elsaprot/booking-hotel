import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/core/city_model/CityModel.dart';
import '../../../../../../core/widgets/custom_text.dart';

class HotelsScreenBar extends StatelessWidget {
  const HotelsScreenBar({Key? key, required this.cityModel,  }) : super(key: key);
  final CityModel cityModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
          const SizedBox(width: 3),
          CustomText(
            text: cityModel.cityName!,
            size: 20,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
