import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickytour/constants.dart';
import 'package:pickytour/features/booking/presentation/payment/view/payment_widgets/payment_text_field.dart';

import '../manager/payment_cubit.dart';

class FormCenterBody extends StatelessWidget {
  const FormCenterBody({Key? key,required this.bookingDataMap}) : super(key: key);
  final Map<String,dynamic> bookingDataMap;

  @override
  Widget build(BuildContext context) {
    PaymentCubit cubit = BlocProvider.of<PaymentCubit>(context);
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
                    cubit.firstName=x;
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
                  cubit.lastName=x;
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
            cubit.nationalId=x;
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
        Row(
          children: [
            Expanded(
              flex: 4,
              child: PaymentTextField(
                label: 'Phone',
                keyboard: TextInputType.number,
                onChange: (x) {
                  bookingDataMap['Phone'] = x;
                  cubit.phone=x;
                },
                perText: '+ 20',
                validateFun: (x) {
                  if (x!.length == 10) {
                    try {
                      int.parse(x!);
                      return null;
                    } catch (e) {
                      return 'only numbers field';
                    }
                  } else {
                    return 'expected 10 num';
                  }
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: PaymentTextField(
                label: 'City',
                keyboard: TextInputType.text,
                onChange: (x) {
                  bookingDataMap['clientCity']=x;
                  cubit.city=x;
                },
                validateFun: (city){
                  if(city!.isEmpty){
                    return 'required field';
                  }else if(Governorates.contains(city.toString())){
                    return null;
                  }else{
                    return 'ادخل اسم محافظتك';
                  }
                },),
            ),
          ],
        ),
        PaymentTextField(
          label: 'Detailed address',
          keyboard: TextInputType.name,
          onChange: (x) {
            bookingDataMap['address']=x;
            cubit.detailedAddress=x;
          },
          validateFun: (address){
            if(address!.isEmpty){
              return 'required field';
            }else {
              return null;
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


