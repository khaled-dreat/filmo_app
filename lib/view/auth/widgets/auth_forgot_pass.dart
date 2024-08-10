import 'package:flutter/material.dart';

class AuthForgotPass extends StatelessWidget {
  const AuthForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          // AppRoutes.go(context, ForgotPassView.nameRoute);
        },
        child: Text(
          "Forgot Pass",
        ),
      ),
    );
  }
}
