import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/themes/app_theme.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? icon;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const CommonButton({
    super.key,
    required this.title,
    this.onTap,
    this.borderRadius,
    this.padding,
    this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppTheme.getInstance().linearButton,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        ),
        icon: icon,
        label: Text(
          title,
          style: style ??
              const TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.bold,
              ),
        ),
        onPressed: onTap?.call,
      ),
    );
  }
}
