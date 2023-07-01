import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickytour/features/booking/presentation/booking/view/booking_widgets/pay_button.dart';
import 'package:pickytour/features/booking/presentation/booking/view/booking_widgets/price_row.dart';
import '../../../../../../core/city_model/Hotels.dart';
import '../manager/booking_data_cubit.dart';
import '../manager/booking_data_states.dart';
import 'booking_center_body.dart';
import 'booking_item.dart';
import 'date_picker.dart';
import 'hotel_images_pageview.dart';

class BookingBody extends StatelessWidget {
   const BookingBody({
    super.key,
    required this.hotel,
  });
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      BookingDataCubit cubit = BlocProvider.of<BookingDataCubit>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: size.height * .35,
            child: HotelImages(
              imgsUrl: hotel.imageLinks!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Column(
              children: [
                BookingCenterBody(hotel: hotel),
                const Divider(thickness: 1,height: 30,color: Colors.black26,),
                BlocBuilder<BookingDataCubit,BookingDataStates>(
                  builder: (context,state) {
                    return Column(
                      children: [
                        Row(
                          children:  [
                            BookingItem(itemTitle: 'regular',dataItem: cubit.regularRome.toInt(),
                              incrementFun: ()=> cubit.changeRegularRome('+'),
                              decrementFun: ()=> cubit.changeRegularRome('-'),
                            ),
                            const Spacer(),
                            BookingItem(itemTitle: 'suite',dataItem: BlocProvider.of<BookingDataCubit>(context).suiteRome.toInt(),
                              incrementFun: ()=> cubit.changeSuite('+'),
                              decrementFun: ()=> cubit.changeSuite('-'),
                            )
                          ],
                        ),
                        SizedBox(height: size.height*.01,),
                        Row(
                          children: [
                            BookingItem(itemTitle: 'days    ',dataItem: BlocProvider.of<BookingDataCubit>(context).days.toInt(),
                              incrementFun: ()=> BlocProvider.of<BookingDataCubit>(context).changeBookingDays('+'),
                              decrementFun: ()=> BlocProvider.of<BookingDataCubit>(context).changeBookingDays('-'),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text('date',style: TextStyle(fontSize: size.width*.04,fontWeight: FontWeight.bold),),
                                const SizedBox(width: 10,),
                                const BookingDate()
                              ],
                            ),
                          ],
                        ),
                        PriceRow(hotelPrice: cubit.calcCoast(hotel),),
                        SizedBox(height: size.height*.04,),
                        PaymentButton(hotel: hotel,)
                      ],
                    );
                  }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}



