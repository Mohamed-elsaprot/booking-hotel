import 'package:flutter/material.dart';
import '../../../../../../../constants.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custom_text.dart';

class TopBody extends StatelessWidget {
  const TopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Column(
        children: [
          SizedBox(
            height: size.height * .05,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .6,
                child: CustomText(
                  text: 'where would you\n like to go?',
                  size: size.width * .055,
                  fW: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/monkey.jpg'),
                          fit: BoxFit.fill)),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .025,
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .08),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 58,
                    width: size.width*.48,
                    child: Material(
                      color: Colors.transparent,
                      elevation: 10,
                      shadowColor: Colors.black54,
                      child: TextFormField(
                        onChanged: (data) {},
                        decoration: InputDecoration(
                            hintText: 'search for place...',
                            hintStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, .3),
                            ),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            errorBorder: borderStyle(),
                            fillColor: lightColor,
                            filled: true
                        ),
                        cursorColor: coffeeColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    //color:Color(0xff62CDFF), //const Color.fromRGBO(122, 105, 99, 0.86),
                    textColor: lightColor,
                    radius: 47,
                    text: 'search',
                    fontSize: 22,
                    fW: FontWeight.w500,
                    hPadding: 8,
                    onPressed: () {},
                  ),

                ],
              ),
            ),
          ),
        ],
    );
  }
  borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(width: 0, color: lightColor),
    );
  }

}
