import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/core/config/themes/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? icon;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? color;
  final LinearGradient? gradient;
  final double? width;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.borderRadius,
    this.padding,
    this.icon,
    this.style,
    this.color,
    this.gradient,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap?.call,
      child: Container(
        width: width,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: (color != null || gradient != null)
                ? Colors.transparent
                : AppTheme.getInstance().primaryColor,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius ?? 8.r,
          ),
          gradient: gradient,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox(),
            Padding(
              padding: EdgeInsets.only(
                left: icon != null ? 4 : 0,
              ),
              child: Text(
                title,
                style: style ??
                    AppTextStyle.boldText.copyWith(
                      color: AppTheme.getInstance().barrierColor,
                      fontSize: 12.sp,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
