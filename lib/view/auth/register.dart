import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/c_auth.dart';
import '../widgets/button/custom_btn.dart';
import '../widgets/loading/app_loading.dart';
import '../widgets/toast/app_toast.dart';
import 'widgets/auth_app_bar.dart';
import 'widgets/auth_app_icon.dart';
import 'widgets/auth_field_email.dart';
import 'widgets/auth_field_pass.dart';
import 'widgets/auth_footer.dart';

class PageRegister extends StatefulWidget {
  static const String nameRoute = 'PageRegister';
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return Scaffold(
      appBar: AuthAppBar(title: "Register"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              key: PageRegister.keyForm,
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
                  // * Space
                  SizedBox(
                    height: 14,
                  ),

                  // * Confirm Pass
                  const AuthFieldPass(isConfirm: true),
                  // * Space
                  SizedBox(
                    height: 14,
                  ),
                  // * Forgot Pass
                  // * idea from Abdallah
                  // Visibility(
                  //   visible: false,
                  //   child: AuthForgotPass(),
                  //   maintainSize: true,
                  //   maintainAnimation: true,
                  //   maintainState: true,
                  // ),

                  // * Button Sign in
                  pAuth.loading
                      ? const AppLoading(loading: TypeLoading.send)
                      : CustomBtn(
                          title: "Register",
                          onTap: () async {
                            if (PageRegister.keyForm.currentState?.validate() ??
                                false) {
                              // ✅
                              PageRegister.keyForm.currentState?.save();
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
                    onTap: () {
                      Navigator.pop(context);
                    },
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
