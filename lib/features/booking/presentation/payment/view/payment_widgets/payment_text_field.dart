import 'package:flutter/material.dart';
import 'package:pickytour/core/widgets/custom_text.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField({Key? key, required this.label, required this.onChange, this.validateFun, required this.keyboard, this.icon}) : super(key: key);

  final String label;
  final Function(String) onChange;
  final String? Function(String?)? validateFun;
  final TextInputType keyboard;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: label, size: 18,color: Colors.black45,),
          const SizedBox(height: 10,),
          TextFormField(
            validator:validateFun??
                    (data) {
                  if (data!.isEmpty) {
                    return 'field is required';
                  }
                  return null;
                },
            style: TextStyle(fontSize: size.width*.045,fontWeight: FontWeight.w400),
            onChanged: onChange,
            keyboardType: keyboard,
            cursorColor: Colors.grey,
            decoration:  const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              //   enabledBorder: borderStyle(Colors.black12),
              //   focusedBorder: borderStyle(Colors.blueAccent),
              //   errorBorder: borderStyle(Colors.red)
               ),

          ),
        ],
      ),
    );
  }

  InputBorder borderStyle(Color c) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(width: 1.5, color: c));
  }
}
