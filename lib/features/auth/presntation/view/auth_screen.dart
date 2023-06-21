import 'package:flutter/material.dart';
import 'package:pickytour/core/widgets/build_scaffold.dart';
import 'package:pickytour/features/auth/presntation/view/widgets/auth_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const BuildScaffold(
        scaffold: Scaffold(
          backgroundColor: Colors.transparent,
          body: AuthBody(),)
    );
  }
}
