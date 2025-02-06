import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/utils/style_utils.dart';

class OnBoardingCommon extends StatelessWidget {
  const OnBoardingCommon({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.titleStyle,
  });
  final TextStyle? titleStyle;
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        toolBarHeight,
        Image.asset(image),
        toolBarHeight,
        Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle ??
              AppTextStyle.aksharText
                  .copyWith(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        spaceH9,
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: titleStyle ?? AppTextStyle.aksharText.copyWith(fontSize: 13),
        ),
      ],
    );
  }
}
