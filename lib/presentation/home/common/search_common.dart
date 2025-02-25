import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/themes/app_theme.dart';

class SearchCommon extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextStyle? style;
  final BorderRadius? borderRadius;
  final Icon? icon;
  final Color? fillColor;
  final bool filled;
  final TextAlign textAlign;

  const SearchCommon({
    this.textAlign = TextAlign.start,
    this.filled = true,
    this.fillColor,
    this.icon,
    this.borderRadius,
    this.style,
    required this.hint,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      shadowColor: AppTheme.getInstance().lightGrey,
      child: TextField(
        controller: controller,
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: style ??
              AppTextStyle.lightText.copyWith(
                color: AppTheme.getInstance().lightGrey,
              ),
          border: UnderlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          filled: filled,
          fillColor: fillColor ?? Colors.white,
          prefixIcon: icon ??
              Icon(
                CupertinoIcons.search,
                color: AppTheme.getInstance().lightGrey,
              ),
        ),
      ),
    );
  }
}
