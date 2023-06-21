import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_text.dart';
import '../manager/booking_data_cubit.dart';
import '../manager/booking_data_states.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({Key? key, required this.hotelPrice,}) : super(key: key);
   final double hotelPrice;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        BlocBuilder<BookingDataCubit,BookingDataStates>(
          builder: (context,state) {
            return Checkbox(
              activeColor: Colors.black26,//const Color(0xffD9D9FB),
              checkColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              value: BlocProvider.of<BookingDataCubit>(context).allServices,
              onChanged: (val){
              BlocProvider.of<BookingDataCubit>(context).changeServices(val!);
            },
            );
          }
        ),
        CustomText(
          text: 'all services',
          size: size.width*.036,
          color: Colors.black.withOpacity(.5),
          textAlign: TextAlign.start,
          shadowsList: const [BoxShadow()],
        ),
        const Spacer(),
        Price(totalCoast: hotelPrice.toInt(),)
      ],
    );
  }
}

class Price extends StatelessWidget {
  const Price({super.key, required this.totalCoast});
  final int totalCoast;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('EGP ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: const EdgeInsets.only(right: 40),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Center(child: Text('$totalCoast',style: const TextStyle(fontSize: 20),)),
        ),
      ],
    );
  }
}
