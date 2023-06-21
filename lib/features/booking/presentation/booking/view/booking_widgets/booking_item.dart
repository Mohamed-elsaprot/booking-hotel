import 'package:flutter/material.dart';
import 'package:pickytour/constants.dart';

import '../../../../../../core/widgets/booking_action.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({Key? key, required this.itemTitle, required this.incrementFun, required this.dataItem,required this.decrementFun}) : super(key: key);
  final String itemTitle;
  final Function() incrementFun;
  final Function() decrementFun;
  final int dataItem;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Text(itemTitle,style: TextStyle(fontSize: size.width*.04,fontWeight: FontWeight.bold),),
        const SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
             color:blueColor,
          ),
          height: size.height*.04,
          child: Row(
            children:  [
              BookingAction(
                  text: '-',
                  radius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  onPressed: decrementFun),
              Text('$dataItem',style: TextStyle(fontSize: size.width*.03,fontWeight: FontWeight.bold,color: lightColor),textAlign: TextAlign.center,),
              BookingAction(
                  text: '+',
                  radius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  onPressed: incrementFun),
            ],
          ),
        ),
      ],
    );
  }
}
