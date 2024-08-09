import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/c_auth.dart';
import '../widgets/button/custom_btn.dart';
import '../widgets/loading/app_loading.dart';
import 'widgets/auth_app_bar.dart';
import 'widgets/auth_app_icon.dart';
import 'widgets/auth_field_email.dart';
import 'widgets/auth_footer.dart';

class ForgotPassView extends StatelessWidget {
  static const String nameRoute = 'ForgotPassView';
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  const ForgotPassView({super.key});
  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: AuthAppBar(title: "Forgot Pass"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
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
                  // * hint Reset pass
                  Text(
                    "Hint Reset Pass",
                    textAlign: TextAlign.center,
                  ),
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
                  // * Button Sign in
                  pAuth.loading
                      ? const AppLoading(loading: TypeLoading.send)
                      : CustomBtn(
                          title: "send",
                          onTap: () {
                            if (keyForm.currentState?.validate() ?? false) {
                              // ✅

                              keyForm.currentState?.save();
                              Navigator.pop(context);
                            }
                          },
                        ),
                  // * Space
                  SizedBox(
                    height: 14,
                  ),
                  // * Footer
                  AuthFooter(
                    first: "Have Account",
                    second: "Login",
                    onTap: () => Navigator.pop(context),
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
