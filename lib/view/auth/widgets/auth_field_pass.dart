import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/c_auth.dart';
import '../../../utils/constant/app_icons.dart';
import '../../../utils/validators/app_validators.dart';
import '../../widgets/text_form/text_form_field.dart';

class AuthFieldPass extends StatelessWidget {
  const AuthFieldPass({super.key, this.isConfirm = false});
  final bool isConfirm;
  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);
    // TODO : ADD to constant
    return CustomTextForm(
      label: isConfirm ? "Confirm Pass" : "Pass",
      preIcon: AppIcons.pass,
      postIcon: pAuth.icon,
      isPass: pAuth.isNotShowPass,
      validator: (value) {
        return isConfirm
            ? AppValidators.checkConfirmPass(value, pAuth.currentPass)
            : AppValidators.checkPass(value);
      },
      onChanged: !isConfirm ? pAuth.setCurrentPass : null,
      onSaved: pAuth.userAuth.setPass,
    );
  }
}
