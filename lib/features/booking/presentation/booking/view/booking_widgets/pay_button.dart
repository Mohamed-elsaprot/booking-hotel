import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/core/city_model/Hotels.dart';
import 'package:pickytour/core/utils/routers.dart';
import 'package:pickytour/features/booking/presentation/booking/view/manager/booking_data_cubit.dart';
import '../../../../../../constants.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({Key? key, required this.hotel,}) : super(key: key);
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MaterialButton(onPressed: (){
          GoRouter.of(context).push(AppRouter.paymentScreen,
              extra: {
                  'hotel':hotel.name,
                 'totalCoast':BlocProvider.of<BookingDataCubit>(context).calcCoast(hotel).toInt(),
                 'regularRome':BlocProvider.of<BookingDataCubit>(context).regularRome.toInt(),
                 'suiteRome':BlocProvider.of<BookingDataCubit>(context).suiteRome.toInt(),
                 'days':BlocProvider.of<BookingDataCubit>(context).days.toInt(),
                'allServices':BlocProvider.of<BookingDataCubit>(context).allServices,
                'date': BlocProvider.of<BookingDataCubit>(context).dateTime.toString()
              }
          );
        },
          color: payButtonColor,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(width: 2,color: lightColor),
          ),child: Text('Bank payment',style: TextStyle(color: lightColor,fontSize: size.width*.045,fontFamily: family,fontWeight: FontWeight.w900),),
        ),
        SizedBox(height: size.height*.04,),
      ],
    );
  }
}
