import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/constants.dart';
import 'package:pickytour/core/widgets/custom_button.dart';
import 'package:pickytour/features/splash/presentation/views/widgets/animated_Image.dart';
import '../../../../../core/utils/routers.dart';
import 'animated_text.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> scaleAni;
  late Animation<double> rotateAni;

  void initAnimation(){
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        lowerBound: 0,
        upperBound: 1);
    scaleAni=Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    rotateAni=Tween<double>(
      begin: 0,
      end: 2,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.forward();
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .13,
        ),
        AnimatedSplashImage(height: size.height * .40,rotateAni: rotateAni,),
        SizedBox(
          height: size.height * .04,
        ),
        AnimatedText(scaleAni: scaleAni,),
        SizedBox(height: size.height*.15,),
        CustomButton(radius: 20, text: 'Get Started', onPressed: (){
          GoRouter.of(context).push(AppRouter.authScreenRouter);
        }, hPadding: 21,fontSize: 30,textColor: lightColor,),
      ],
    );
  }
}
