import 'package:filmo_app/utils/theme/app_colors.dart';
import 'package:filmo_app/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/c_auth.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    this.initValue,
    this.keyboardType,
    this.isPass = false,
    this.validator,
    this.onSaved,
    this.onChanged,
    // * Decoration
    this.hint,
    this.label,
    this.help,
    this.preIcon,
    this.postIcon,
  });
  final String? initValue;
  final TextInputType? keyboardType;
  final bool isPass;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  // * Decoration
  final String? hint;
  final String? label;
  final String? help;
  final IconData? preIcon;
  final IconData? postIcon;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerAuth pAuth = Provider.of<ControllerAuth>(context);

    return TextFormField(
      focusNode: focusNode,
      initialValue: widget.initValue,
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.grey,
      obscureText: widget.isPass,
      obscuringCharacter: '✵',
      textCapitalization: TextCapitalization.none,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        labelStyle: TextStyle(color: AppColors.grey),
        border: InputBorder.none,
        helperText: widget.help,
        helperMaxLines: 2,
        prefixIcon: widget.preIcon != null
            ? Icon(
                widget.preIcon,
                color: focusNode.hasFocus ? AppColors.grey : Colors.grey,
              )
            : null,
        suffixIcon: widget.postIcon != null
            ? IconButton(
                onPressed: () => pAuth.changeIcon(),
                icon: Icon(
                  widget.postIcon,
                  color: AppColors.grey,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.soft, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.soft, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.soft, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
