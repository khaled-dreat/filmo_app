import 'package:filmo_app/utils/routes/app_routes.dart';
import 'package:filmo_app/view/home/home_view.dart';
import 'package:filmo_app/view/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/c_auth.dart';
import '../widgets/button/custom_btn.dart';
import '../widgets/loading/app_loading.dart';
import 'widgets/auth_app_bar.dart';
import 'widgets/auth_app_icon.dart';
import 'widgets/auth_field_email.dart';
import 'widgets/auth_field_pass.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_forgot_pass.dart';
import 'widgets/coustom_login_text.dart';

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
                  const SizedBox(
                    height: 14,
                  ),
                  const CoustomLoginText(),

                  // * Space
                  const SizedBox(
                    height: 100,
                  ),
                  // * user name
                  const AuthFieldUserName(),
                  // * Space
                  const SizedBox(
                    height: 40,
                  ),
                  // * Pass
                  const AuthFieldPass(),
                  const SizedBox(
                    height: 200,
                  ),
                  // * Button Sign in
                  pAuth.loading
                      ? const AppLoading(loading: TypeLoading.send)
                      : Row(
                          children: [
                            Expanded(
                              child: CustomBtn(
                                title: "login",
                                onTap: () async {
                                  if (keyForm.currentState?.validate() ??
                                      false) {
                                    // ✅

                                    keyForm.currentState?.save();
                                    if (await pAuth.login() != null || false) {
                                      AppRoutes.go(context, HomeView.nameRoute);
                                    } else {
                                      AppToast.toast(
                                          "Invalid username and/or password: You did not provide a valid login.");
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                  // * Space
                  const SizedBox(
                    height: 14,
                  ),
                  // * Footer
                  AuthFooter(
                      first: "Not Account",
                      second: "Register",
                      onTap:
                          () {} //AppRoutes.go(context, PageRegister.nameRoute),
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
