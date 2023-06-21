import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/core/widgets/custom_text.dart';
import 'package:pickytour/features/booking/presentation/payment/view/manager/payment_cubit.dart';
import 'package:pickytour/features/booking/presentation/payment/view/payment_widgets/payment_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key, required this.bookingDataMap,}) : super(key: key);
  final Map<String,dynamic> bookingDataMap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> PaymentCubit()..getAuthToken(),
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back)),
        title: const CustomText(text: 'CARDS', size: 20,color: Colors.black87,),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: PaymentBody(bookingDataMap: bookingDataMap,),
    ),
    );
  }
}

