import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/gen/assets.gen.dart';
import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Items extends StatelessWidget {
  final double? width;
  final double? height;
  final AssetGenImage image;
  final String textItem;
  final TextStyle? style;
  final VoidCallback? onTap;

  const Items({
    this.width,
    this.height,
    this.style,
    required this.image,
    this.onTap,
    required this.textItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 299.w,
        height: height ?? 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: image.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceH90,
              Text(
                textItem,
                style: style ??
                    AppTextStyle.boldText.copyWith(
                      color: Colors.white,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
