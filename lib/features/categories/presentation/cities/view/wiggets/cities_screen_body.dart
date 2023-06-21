import 'package:flutter/material.dart';
import 'package:pickytour/core/widgets/design_container.dart';
import 'cities_list.dart';
import 'cities_top_body.dart';
import 'get_inspired_text.dart';

class CitiesScreenBody extends StatelessWidget {
  const CitiesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        DesignContainer(topMargin: size.height * .27),
        const TopBody(),
        const GetInspiredText(),
        Container(
          margin: EdgeInsets.only(top: size.height * .4),
          child: const CitiesList()
        )
      ],
    );
  }
}
