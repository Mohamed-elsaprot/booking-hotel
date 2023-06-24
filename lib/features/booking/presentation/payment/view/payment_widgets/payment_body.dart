import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickytour/features/booking/presentation/payment/view/manager/payment_cubit.dart';
import 'package:pickytour/features/booking/presentation/payment/view/manager/payment_states.dart';
import 'package:pickytour/features/booking/presentation/payment/view/payment_widgets/form_center_ body.dart';
import 'package:pickytour/features/booking/presentation/payment/view/payment_widgets/payment_top_half.dart';
import 'form_bottom_body.dart';

class PaymentBody extends StatelessWidget {
   PaymentBody({Key? key, required this.bookingDataMap}) : super(key: key);
  final Map<String,dynamic> bookingDataMap;
  final GlobalKey<FormState> formKey = GlobalKey();

   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PaymentCubit,PaymentStates>(
        listener: (context,state){},
        builder: (context,state){
          return Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const VisaPic(),
                FormCenterBody(bookingDataMap: bookingDataMap),
                SizedBox(height: size.height*.02,),
                FormBottomBody(formKey:formKey,bookingDataMap:bookingDataMap),
                const SizedBox(height: 15,),
              ],
            ),
          );
        });
  }

  // void setCardData(){
  //   bookingDataMap['cardType']='';
  //   bookingDataMap['cardNum']='';
  //   bookingDataMap['cardHolder']='';
  //   bookingDataMap['ExpiryDate']='';
  //   bookingDataMap['cvv']='';
  //
  // }
}
