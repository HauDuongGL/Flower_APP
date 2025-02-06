import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';

class FieldTextCommon extends StatelessWidget {
  final BorderSide? borderSide;
  final String labelText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final bool isPassword;

  FieldTextCommon({
    this.isPassword = false,
    this.borderSide,
    this.labelStyle,
    this.suffixIcon,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: borderSide ??
              const BorderSide(
                color: colorMintyFresh,
                width: Dimens.d2,
              ),
        ),
        labelText: labelText,
        labelStyle: labelStyle ??
            AppTextStyle.mediumText.copyWith(
              fontSize: Dimens.d12,
              fontWeight: null,
              color: color6A6F7D,
            ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
