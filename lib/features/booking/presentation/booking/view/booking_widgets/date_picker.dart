import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pickytour/features/booking/presentation/booking/view/manager/booking_data_cubit.dart';
import '../../../../../../constants.dart';

class BookingDate extends StatefulWidget {
  const BookingDate({Key? key}) : super(key: key);

  @override
  State<BookingDate> createState() => _BookingDateState();
}

class _BookingDateState extends State<BookingDate> {
  DateTime selectedDate= DateTime.now().add(const Duration(days: 2));

  Future datePicker() async => showDatePicker(
      context: context ,
      initialDate: selectedDate,
      firstDate: DateTime.now().add(const Duration(days: 2)),
      lastDate: DateTime.utc(2026,1,1) //DateTime(2024),

  ).then((value){
    if(value==null){return;}
    setState(() {
      selectedDate=value;
       BlocProvider.of<BookingDataCubit>(context).setBookingDate(value);
    });
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialButton(
      color: blueColor,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side:const BorderSide(color: lightColor,width: 1.5)
      ),
      onPressed: datePicker,
      child: Text(DateFormat().add_yMMMd().format(selectedDate),style: TextStyle(fontSize: size.width*.035,color: lightColor),),
    );
  }
}
