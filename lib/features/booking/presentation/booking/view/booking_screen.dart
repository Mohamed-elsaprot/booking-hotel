import 'package:flutter/material.dart';
import 'package:pickytour/core/city_model/Hotels.dart';
import 'booking_widgets/Booking_body.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BookingBody(hotel: hotel,),
    );
  }
}
