import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickytour/features/booking/presentation/payment/view/manager/payment_cubit.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/functions.dart';
import '../../../../../../core/widgets/loading_indecator.dart';
import '../../../../../auth/presntation/manager/auth_cubit.dart';
import '../../../booking/view/booking_widgets/price_row.dart';
import '../../../booking/view/manager/booking_data_cubit.dart';
import '../../../booking/view/manager/booking_data_states.dart';

class FormBottomBody extends StatelessWidget {
  const FormBottomBody(
      {Key? key, required this.bookingDataMap, required this.formKey})
      : super(key: key);
  final Map<String, dynamic> bookingDataMap;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              width: size.width * .4,
              child: BlocConsumer<BookingDataCubit, BookingDataStates>(
                  listener: (context, state) {
                if (state is SubmitFailed) {
                  customSnackBar(context, state.errorMessage);
                  print(state.errorMessage);
                }
              }, builder: (context, state) {
                if (state is SubmitLoading) {
                  return const LoadingIndicator();
                } else if (state is SubmitSuccess) {
                  return Row(
                    children: [
                      Text(
                        'Order sent  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * .04),
                      ),
                      const Icon(
                        Icons.done_all,
                        color: Colors.green,
                      )
                    ],
                  );
                } else {
                  //customSnackBar(context, 'Something Wrong Please try again...');
                  return MaterialButton(
                    onPressed: () async {
                      PaymentCubit cubit = BlocProvider.of<PaymentCubit>(context);
                      //await cubit.getOrderId(firstName: 'mohamed', lastName: 'yasser', phone: '01001231231', price: '${(bookingDataMap['totalCoast']*100).toInt()}',email: BlocProvider.of<AuthCubit>(context).account!);
                      if (formKey.currentState!.validate()) {
                        bookingDataMap['account'] = BlocProvider.of<AuthCubit>(context).account;
                        bookingDataMap['userId'] = BlocProvider.of<AuthCubit>(context).userId;
                        bookingDataMap['createdIn'] = DateTime.now();
                        BlocProvider.of<BookingDataCubit>(context).postBookingData(bookingDataMap);
                        await cubit.getOrderId(
                          price: '${(bookingDataMap['totalCoast'] * 100).toInt()}',
                          email: BlocProvider.of<AuthCubit>(context).account!,
                          order: bookingDataMap,
                          firstName: cubit.firstName,
                          lastName: cubit.lastName,
                          phone: cubit.phone,
                          country: cubit.country,
                          city: cubit.city,
                          detailedAddress: cubit.detailedAddress,
                        );
                      }
                    },
                    color: blueColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(width: 2, color: lightColor),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: lightColor,
                          fontSize: size.width * .045,
                          fontFamily: family,
                          fontWeight: FontWeight.w900),
                    ),
                  );
                }
              }),
            ),
            Price(totalCoast: bookingDataMap['totalCoast'].toInt()),
          ],
        ),
      ],
    );
  }
}

//C:\flutter\bin\cache\dart-sdk
