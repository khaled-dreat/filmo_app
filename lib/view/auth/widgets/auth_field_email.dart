import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/c_auth.dart';
import '../../../utils/constant/app_icons.dart';
import '../../../utils/validators/app_validators.dart';
import '../../widgets/text_form/text_form_field.dart';

class AuthFieldUserName extends StatelessWidget {
  const AuthFieldUserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);
    return CustomTextForm(
      label: "Email",
      preIcon: AppIcons.mail,
      validator: AppValidators.isUserName,
      keyboardType: TextInputType.emailAddress,
      onSaved: pAuth.userAuth.setEmail,
    );
  }
}
