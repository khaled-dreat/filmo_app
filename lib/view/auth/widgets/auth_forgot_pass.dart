import 'package:flutter/material.dart';

import '../../../utils/routes/app_routes.dart';
import '../forgot_pass.dart';

class AuthForgotPass extends StatelessWidget {
  const AuthForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          AppRoutes.go(context, ForgotPassView.nameRoute);
        },
        child: Text(
          "forgot Pass",
        ),
      ),
    );
  }
}
