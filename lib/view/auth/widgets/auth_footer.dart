import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.first,
    required this.second,
    required this.onTap,
  });

  final String first, second;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: first,
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          const TextSpan(text: ' '),
          TextSpan(
            text: second,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
