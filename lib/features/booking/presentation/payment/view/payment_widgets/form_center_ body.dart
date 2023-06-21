import 'package:flutter/material.dart';
import 'package:pickytour/features/booking/presentation/payment/view/payment_widgets/payment_text_field.dart';

class FormCenterBody extends StatelessWidget {
  const FormCenterBody({Key? key,required this.bookingDataMap}) : super(key: key);
  final Map<String,dynamic> bookingDataMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: PaymentTextField(
                  label: 'First Name',
                  keyboard: TextInputType.name,
                  onChange: (x) {
                    bookingDataMap['FirstName']=x;
                  },
                validateFun: (firstName){
                    if(firstName!.isEmpty){
                      return 'required field';
                    }else {
                      return null;
                    }
                },
                  ),
            ),
            Flexible(
              child: PaymentTextField(
                label: 'Last Name',
                keyboard: TextInputType.text,
                onChange: (x) {
                  bookingDataMap['LastName']=x;
                },
                validateFun: (lastName){
                  if(lastName!.isEmpty){
                    return 'required field';
                  }else {
                    return null;
                  }
                },),
            ),
          ],
        ),
        PaymentTextField(
          label: 'National Id',
          keyboard: TextInputType.number,
          onChange: (x) {
            bookingDataMap['nationalId'] = x;
          },
          validateFun: (x) {
            if (x!.length == 14) {
              try {
                int.parse(x!);
                return null;
              } catch (e) {
                return 'only numbers field';
              }
            } else {
              return 'expected 14 num';
            }
          },
        ),
        PaymentTextField(
          label: 'Phone',
          keyboard: TextInputType.number,
          onChange: (x) {
            bookingDataMap['Phone'] = x;
          },
          validateFun: (x) {
            if (x!.length == 11) {
              try {
                int.parse(x!);
                return null;
              } catch (e) {
                return 'only numbers field';
              }
            } else {
              return 'expected 11 num';
            }
          },
        ),
      ],
    );
  }
}

//PaymentTextField(
//           label: 'Card Holder', keyboard: TextInputType.name,
//           onChange: (x) {
//             bookingDataMap['cardHolder']=x;
//           },
//           validateFun: (x){
//             if(x!.isEmpty){
//               return 'field is required';
//             }
//           },
//         ),
//         PaymentTextField(
//           label: 'Card Type', keyboard: TextInputType.name,
//           onChange: (x) {
//             bookingDataMap['cardType']=x;
//           },
//           validateFun: (x){
//             if(x!.isEmpty){
//               return 'field is required';
//             }else if(x == 'visa'){return null;}
//             else if(x == 'master card'){return null;}
//             else{
//               return 'visa or master card only';
//             }
//           },
//         ),

//if(x!.length == 3){
//                     try{
//                       //int.tryParse(x!);
//                       int.parse(x!);
//                       return null;
//                     }catch(e){
//                       return 'only numbers field';
//                     }
//                   }else {
//                     return 'expected 3 num';
//                   }


