import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/c_auth.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/button/custom_btn.dart';
import '../widgets/loading/app_loading.dart';
import '../widgets/toast/app_toast.dart';
import 'register.dart';
import 'widgets/auth_app_bar.dart';
import 'widgets/auth_app_icon.dart';
import 'widgets/auth_field_email.dart';
import 'widgets/auth_field_pass.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_forgot_pass.dart';

class SingInView extends StatelessWidget {
  static const String nameRoute = 'SingInView';
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  const SingInView({super.key});
  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: const AuthAppBar(title: "Login"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              key: keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // * Space
                  SizedBox(
                    height: 14,
                  ),
                  // * logo
                  const AuthAppIcon(),
                  // * Space
                  SizedBox(
                    height: 14,
                  ),
                  // * Email
                  const AuthFieldEmail(),
                  // * Space
                  SizedBox(
                    height: 14,
                  ),
                  // * Pass
                  const AuthFieldPass(),
                  // * Forgot Pass
                  const AuthForgotPass(),

                  // * Button Sign in
                  pAuth.loading
                      ? const AppLoading(loading: TypeLoading.send)
                      : CustomBtn(
                          title: "login",
                          onTap: () async {
                            if (keyForm.currentState?.validate() ?? false) {
                              // ✅

                              keyForm.currentState?.save();
                            }
                          },
                        ),
                  // * Space
                  SizedBox(
                    height: 14,
                  ),
                  // * Footer
                  AuthFooter(
                    first: "Not Account",
                    second: "Register",
                    onTap: () => AppRoutes.go(context, PageRegister.nameRoute),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
