import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          child: SizedBox(
            width: Dimens.d200.w,
            height: Dimens.d200.h,
            child: Assets.images.backgrondSpringFlowers.image(
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 5.h,
          left: 5.w,
          child: GestureDetector(
            onTap: () => print('love'),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color9D9D9D,
              ),
              child: Icon(CupertinoIcons.heart),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: color9D9D9D.withOpacity(0.8),
            ),
            child: Column(
              children: [
                Text(
                  'Data',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.boldTextKanit.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '23/02/2025',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.boldTextKanit.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
