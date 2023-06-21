import 'package:flutter/material.dart';
import 'package:pickytour/core/widgets/build_scaffold.dart';
import 'package:pickytour/features/splash/presentation/views/widgets/splas_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: BuildScaffold(scaffold: SplashBody())
    );
  }
}
