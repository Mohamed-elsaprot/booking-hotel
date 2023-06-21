import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/core/city_model/CityModel.dart';
import 'package:pickytour/core/utils/routers.dart';
import '../../../doublicated_widgets/cover_item.dart';
import '../../../doublicated_widgets/title_widget.dart';

class HotelsList extends StatelessWidget {
  const HotelsList({Key? key, required this.cityModel }) : super(key: key);
  final CityModel cityModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        padding: const EdgeInsets.only(top: 5),
        itemCount: cityModel.hotels!.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*.19,vertical: 10),
            child: Stack(
              children: [
                CoverItem(
                  url: cityModel.hotels![index].hotelCover!,
                  function: (){
                    GoRouter.of(context).push(AppRouter.bookingScreen, extra: cityModel.hotels![index]);
                  },
                ),
                TitleWidget(title: cityModel.hotels![index].name!,rating: cityModel.hotels![index].rate,)
          ],
            ),
          );
        });
  }
}
